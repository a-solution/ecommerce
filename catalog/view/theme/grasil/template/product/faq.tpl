<?php if ($faqs) { ?>
<?php foreach ($faqs as $review) { ?>
<table class="table table-striped table-bordered">
  <tr>
    <td><strong><?php echo $review['author']; ?></strong> (<?php echo $review['date_added']; ?>)</td>    
  </tr>
  <tr>
    <td>
        <p><?php echo $review['text']; ?></p>
        <p style="padding-left: 20px">
            <i class="fa fa-comments"></i> <u><i>Trả lời</i></u>:
            <?php echo $review['answer_text']; ?>
        </p>
    </td>
  </tr>
</table>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_faqs; ?></p>
<?php } ?>
