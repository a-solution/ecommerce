<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-filter" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-filter" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_group; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="filter_group_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($filter_group_description[$language['language_id']]) ? $filter_group_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_group; ?>" class="form-control" />
              </div>
              <?php if (isset($error_group[$language['language_id']])) { ?>
              <div class="text-danger"><?php echo $error_group[$language['language_id']]; ?></div>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
          <table id="filter" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left required"><?php echo $entry_name ?></td>
                <td class="text-right"><?php echo $entry_sort_order; ?></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php $filter_row = 0; ?>
              <?php foreach ($filters as $filter) { ?>
              <tr id="filter-row<?php echo $filter_row; ?>">
                <td class="text-left"><input type="hidden" name="filter[<?php echo $filter_row; ?>][filter_id]" value="<?php echo $filter['filter_id']; ?>" />
                  <?php foreach ($languages as $language) { ?>
                  <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="filter[<?php echo $filter_row; ?>][filter_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($filter['filter_description'][$language['language_id']]) ? $filter['filter_description'][$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name ?>" class="form-control" />
                  </div>
                  <?php if (isset($error_filter[$filter_row][$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_filter[$filter_row][$language['language_id']]; ?></div>
                  <?php } ?>
                  <?php } ?></td>
                <td class="text-right"><input type="text" name="filter[<?php echo $filter_row; ?>][sort_order]" value="<?php echo $filter['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" /></td>
                <td class="text-left">
                    Option values
                    <select name="cbb_option_values_<?php echo $filter_row; ?>">    
                        <?php foreach($options as $option){?>    
                        <option value="<?php echo $option['option_value_id']; ?>"><?php echo $option['path']; ?></option>
                        <?php }?>
                    </select>
                    <input type="button" value="Add" onclick="SelectToAddCategory('<?php echo $filter_row; ?>', 'cbb_option_values_<?php echo $filter_row ?>');">
                    <div style="height: 80px; overflow: auto;" class="well-sm" id="div_selected_options_<?php echo $filter_row ?>">
                        
                          
                            <?php foreach($filter['option_values'] as $sel_option){?>    
                                <div>
                                    <i onclick="clickMinusCircleButton(this);" class="fa fa-minus-circle"></i> <?php echo $sel_option['path']; ?> 
                                    <input type="hidden" name="filter[<?php echo $filter_row; ?>][options][<?php echo $sel_option['option_value_id']; ?>]" value="<?php echo $sel_option['option_value_id']; ?>">
                                </div>
                            <?php }?>
                        
                        
                    </div>
                    
                </td>
                <td class="text-left"><button type="button" onclick="$('#filter-row<?php echo $filter_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
              </tr>
              <?php $filter_row++; ?>
              <?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="3"></td>
                <td class="text-left"><a onclick="addFilterRow();" data-toggle="tooltip" title="<?php echo $button_filter_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></a></td>
              </tr>
            </tfoot>
          </table>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
var filter_row = <?php echo $filter_row; ?>;

function addFilterRow() {
	html  = '<tr id="filter-row' + filter_row + '">';	
        html += '  <td class="text-left"><input type="hidden" name="filter[' + filter_row + '][filter_id]" value="" />';
	<?php foreach ($languages as $language) { ?>
	html += '  <div class="input-group">';
	html += '    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="filter[' + filter_row + '][filter_description][<?php echo $language['language_id']; ?>][name]" value="" placeholder="<?php echo $entry_name ?>" class="form-control" />';
        html += '  </div>';
	<?php } ?>
	html += '  </td>';
	html += '  <td class="text-right"><input type="text" name="filter[' + filter_row + '][sort_order]" value="" value="" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" /></td>';
	html += '  <td class="text-left">';
        html += '       Option values';
        html += '       <select name="cbb_option_values_'+(filter_row)+'">';
                            <?php foreach($options as $option){?>    
        html +=             '<option value="<?php echo $option['option_value_id']; ?>"><?php echo $option['path']; ?></option>'
                            <?php }?>
        html += '       </select>';
        html += '       <input type="button" onclick="SelectToAddCategory(\''+ filter_row +'\', \'cbb_option_values_'+ filter_row +'\');" value="Add">';
        html += '       <div style="height: 80px; overflow: auto;" class="well-sm" id="div_selected_options_'+(filter_row)+'">';
        html += '       </div>';
        html += '  </td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#filter-row' + filter_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';        
        html += '</tr>';	
	
	$('#filter tbody').append(html);
	
	filter_row++;
}

function SelectToAddCategory(module_id, cbb_control_name){
    var cbb_control = $('select[name=\''+ cbb_control_name +'\']')
    var selText = $('select[name=\''+ cbb_control_name +'\'] option:selected').text();
    var selVal = $('select[name=\''+ cbb_control_name +'\'] option:selected').val()
    
    
    if($("input[name='filter["+module_id+"][options]["+selVal+"]']").length>0 && ($("input[name='filter["+module_id+"][options]["+selVal+"]']").map(function(){return $(this).attr("value");}).get()).indexOf(String(selVal)) >= 0){
            return;
    }
    
    $('#div_selected_options_' + module_id).append('<div><i class="fa fa-minus-circle" onclick="clickMinusCircleButton(this);"></i> ' + selText + '<input name="filter['+module_id+'][options]['+selVal+']" type="hidden" value="' + selVal + '" /></div>');
}

function clickMinusCircleButton(control){
    $(control).parent().remove();
}    


//--></script></div>
<?php echo $footer; ?> 