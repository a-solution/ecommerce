<div class="filter-group">
    <div class="filter-heading"><?php echo $heading_title; ?></div>
    <table class="table-filter">
        <?php foreach ($filter_groups as $filter_group) { ?>    
        <tr>
            <th><?php echo $filter_group['name']; ?></th>        
            <td>
                <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
                    <?php foreach ($filter_group['filter'] as $filter) { ?>
                    <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                    <label>
                        <input class="filchk" name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
                        <?php echo $filter['name']; ?></label>
                    <?php } else { ?>
                    <label>
                        <input class="filchk" name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" />
                        <?php echo $filter['name']; ?></label>
                    <?php } ?>
                    <?php } ?>
                </div>
            </td>
        </tr>    
        <?php } ?>
    </table>
</div>

<script type="text/javascript">
    function advFilter() {
        filter = [];

        $('input[name^=\'filter\']:checked').each(function (element) {
            filter.push(this.value);
        });

        location = '<?php echo $action; ?>&filter=' + filter.join(',');
    }

    $('.table-filter .filchk').each(function(){
        $(this).change(function() {
            advFilter();
        });
    });
</script> 
