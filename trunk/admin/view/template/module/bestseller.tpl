<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-bestseller" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-bestseller" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="bestseller_status" id="input-status" class="form-control">
                <?php if ($bestseller_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>        
          <table id="module" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-right">#</td>
                <td class="text-left"><?php echo $entry_limit; ?></td>
                <td class="text-left"><?php echo $entry_image; ?></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php $module_row = 1; ?>
              <?php foreach ($bestseller_modules as $bestseller_module) { ?>
              <tr id="module-row<?php echo $bestseller_module['key']; ?>">
                <td class="text-right"><?php echo $module_row; ?></td>
                <td class="text-left">
                    <input type="text" name="bestseller_module[<?php echo $bestseller_module['key']; ?>][limit]" value="<?php echo $bestseller_module['limit']; ?>" placeholder="<?php echo $entry_limit; ?>" class="form-control" />
                    <select name="cbb_category_ids_<?php echo $bestseller_module['key']; ?>">    
                        <option value="" selected="selected">-- All--</option>
                        <?php foreach($categories as $category){?>    
                        <option value="<?php echo $category['id']; ?>"><?php echo $category['name']; ?></option>
                        <?php }?>
                    </select>
                    <input type='button' value="Add" onclick="SelectToAddCategory('<?php echo $bestseller_module['key']; ?>', 'cbb_category_ids_<?php echo $bestseller_module['key']; ?>');"/>
                    <?php 
                        $saved_cate_ids = array();
                        if(isset($bestseller_module['category_ids']) && $bestseller_module['category_ids'] != ''){
                            $saved_cate_ids = explode(",", $bestseller_module['category_ids']);
                        }
                    ?>
                    <div id="div_selected_category_ids_<?php echo $bestseller_module['key']; ?>" class="well-sm" style="height: 80px; overflow: auto;">
                    <?php foreach ($categories as $category) { 
                        if (in_array($category['id'], $saved_cate_ids)) {
                    ?>
                    <div>
                        <i class="fa fa-minus-circle" onclick="clickMinusCircleButton(this);"></i> <?php echo $category['name']; ?>
                        <input type="hidden" name="hd_category_id_<?php echo $bestseller_module['key']; ?>" value="<?php echo $category['id']; ?>" />
                    </div>
                    <?php 
                        }
                    } 
                    ?>
                    </div>
                    <input type="hidden" name="bestseller_module[<?php echo $bestseller_module['key']; ?>][category_ids]" value="<?php echo $bestseller_module['category_ids']; ?>" />
                    
                </td>
                <td class="text-left"><input type="text" name="bestseller_module[<?php echo $bestseller_module['key']; ?>][width]" value="<?php echo $bestseller_module['width']; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />
                  <input type="text" name="bestseller_module[<?php echo $bestseller_module['key']; ?>][height]" value="<?php echo $bestseller_module['height']; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  <?php if (isset($error_image[$bestseller_module['key']])) { ?>
                  <div class="text-danger"><?php echo $error_image[$bestseller_module['key']]; ?></div>
                  <?php } ?></td>
                <td class="text-left"><button type="button" onclick="$('#module-row<?php echo $bestseller_module['key']; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
              </tr>
              <?php $module_row++; ?>
              <?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="3"></td>
                <td class="text-left"><button type="button" onclick="addModule();" data-toggle="tooltip" title="<?php echo $button_module_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
        </form>
      </div>
    </div>
  </div>
<script type="text/javascript"><!--
          
function addModule() {
    
	var token = Math.random().toString(36).substr(2);
	
	html  = '<tr id="module-row' + token + '">';
	html += '  <td class="text-right">' + ($('tbody tr').length + 1) + '</td>';
	html += '  <td class="text-left">'
                +'<input type="text" name="bestseller_module[' + token + '][limit]" value="5" placeholder="<?php echo $entry_limit; ?>" class="form-control" />'
                +'<select name="cbb_category_ids_' + token + '">'  
                +'<option value="" selected="selected">-- All--</option>'
                <?php foreach($categories as $category){?>    
                +'<option value="<?php echo $category['id']; ?>"><?php echo $category['name']; ?></option>'
                <?php }?>
                +'</select>'
                +'<input type="button" value="Add" onclick="SelectToAddCategory(\''+ token +'\', \'cbb_category_ids_'+token+'\');"/>'        
                +'<div id="div_selected_category_ids_'+token+'" class="well-sm" style="height: 80px; overflow: auto;">'
                +'</div>'
                +'<input type="hidden" name="bestseller_module['+ token +'][category_ids]" value="" />'
                +'<td class="text-left"><input type="text" name="bestseller_module[' + token + '][width]" value="200" placeholder="<?php echo $entry_width; ?>" class="form-control" /> <input type="text" name="bestseller_module[' + token + '][height]" value="200" placeholder="<?php echo $entry_height; ?>" class="form-control" /></td>'
                +'</td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#module-row' + token + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';	
        html += '</tr>';
	
	$('#module tbody').append(html);
}

function SelectToAddCategory(module_id, cbb_control_name){
    var cbb_control = $('select[name=\''+ cbb_control_name +'\']')
    //$('#featured-product' + item['value']).remove();
    var selText = $('select[name=\''+ cbb_control_name +'\'] option:selected').text();
    var selVal = $('select[name=\''+ cbb_control_name +'\'] option:selected').val()
    var theHiddenFieldName = "bestseller_module["+ module_id +"][category_ids]";
    if(selVal == ''){
        $('#div_selected_category_ids_' + module_id).empty();
        $("input[name='"+ theHiddenFieldName +"']").attr('value', '');
    }
    else{
        if(($("input[name='"+ theHiddenFieldName +"']").attr('value')).split(',').indexOf(String(selVal)) >= 0){
            return;
        }
        $('#div_selected_category_ids_' + module_id).append('<div><i class="fa fa-minus-circle" onclick="clickMinusCircleButton(this);"></i> ' 
                + selText 
                + '<input name=\'hd_category_id_'+module_id+'\' type="hidden" value="' + selVal + '" /></div>');
        data = $.map($('input[name=\'hd_category_id_'+module_id+'\']'), function(element) {
                return $(element).attr('value');
        });
        $("input[name='"+ theHiddenFieldName +"']").attr('value', data.join());
    }
}

function clickMinusCircleButton(control){
    var parentDiv = $(control).parent().parent();
    var tmpArr = parentDiv.attr('id').split('_');
    var module_id = tmpArr[tmpArr.length-1];
    $(control).parent().remove();
    data = $.map($('#'+parentDiv.attr('id')+' input'), function(element) {
		return $(element).attr('value');
    });
    $('input[name=\'bestseller_module['+ module_id +'][category_ids]\']').attr('value', data.join());
}    

//--></script></div>
<?php echo $footer; ?>