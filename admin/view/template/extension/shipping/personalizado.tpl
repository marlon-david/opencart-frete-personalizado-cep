<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Configurar Frete personalizado</h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cost"><?php echo $entry_titulo; ?></label>
            <div class="col-sm-10">
              <input type="text" name="personalizado_titulo" value="<?php echo $personalizado_titulo; ?>" placeholder="<?php echo $entry_titulo; ?>" id="input-cost" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="personalizado_status" id="input-status" class="form-control">
                <?php if ($personalizado_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort_order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="personalizado_sort_order" value="<?php echo $personalizado_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort_order" class="form-control" />
            </div>
          </div>

          <table id="frete-list" class="table table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left" width="15%"><?php echo $entry_nome; ?></td>
                <td class="text-right" width="15%"><?php echo $entry_cost; ?></td>
                <td class="text-right" width="14%">CEP de</td>
                <td class="text-right" width="14%">CEP até</td>
                <td class="text-right" width="14%">Valor mín. compra</td>
                <td class="text-right" width="14%">Valor máx. compra</td>
                <td width="14%"></td>
              </tr>
            </thead>
            <?php $row = 0; ?>
            <?php foreach ($personalizado_fretes as $frete) { ?>
            <tbody id="frete<?php echo $row; ?>">
              <tr>
                <td class="ltext-eft"><input type="text" class="form-control" name="personalizado_fretes[<?php echo $row; ?>][nome]" maxlength="150" size="80" value="<?php echo $frete['nome']; ?>" /></td>
                <td class="text-right"><div class="input-group"><span class="input-group-addon">R$</span><input type="text" class="form-control float" size="2" name="personalizado_fretes[<?php echo $row; ?>][valor]" value="<?php echo $frete['valor']; ?>" /></div></td>
                <td class="text-right"><input type="text" class="form-control cep" id="cepInicial" name="personalizado_fretes[<?php echo $row; ?>][cepInicial]" value="<?php echo $frete['cepInicial']; ?>" /></td>
                <td class="text-right"><input type="text" class="form-control cep" id="cepFinal" name="personalizado_fretes[<?php echo $row; ?>][cepFinal]" value="<?php echo $frete['cepFinal']; ?>"  /></td>
                <td class="text-right"><div class="input-group"><span class="input-group-addon">R$</span><input type="text" class="form-control float" id="valor_min" name="personalizado_fretes[<?php echo $row; ?>][valor_min]" value="<?php echo $frete['valor_min']; ?>" /></div></td>
                <td class="text-right"><div class="input-group"><span class="input-group-addon">R$</span><input type="text" class="form-control float" id="valor_max" name="personalizado_fretes[<?php echo $row; ?>][valor_max]" value="<?php echo $frete['valor_max']; ?>" /></div></td>
                <td class="text-left"><a onclick="$('#frete<?php echo $row; ?>').remove();" class="btn btn-danger"><?php echo $button_remove; ?></a></td>
              </tr>
            </tbody>
            <?php $row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td colspan="6"></td>
                <td class="text-left"><a onclick="addRow();" class="btn btn-primary"><?php echo $button_add; ?></a></td>
              </tr>
            </tfoot>
          </table>

        </form>
      </div>
    </div>
  </div>
<script>
/*
  Masked Input plugin for jQuery
  Copyright (c) 2007-2013 Josh Bush (digitalbush.com)
  Licensed under the MIT license (http://digitalbush.com/projects/masked-input-plugin/#license)
  Version: 1.3.1
*/
(function(e){function t(){var e=document.createElement("input"),t="onpaste";return e.setAttribute(t,""),"function"==typeof e[t]?"paste":"input"}var n,a=t()+".mask",r=navigator.userAgent,i=/iphone/i.test(r),o=/android/i.test(r);e.mask={definitions:{9:"[0-9]",a:"[A-Za-z]","*":"[A-Za-z0-9]"},dataName:"rawMaskFn",placeholder:"_"},e.fn.extend({caret:function(e,t){var n;if(0!==this.length&&!this.is(":hidden"))return"number"==typeof e?(t="number"==typeof t?t:e,this.each(function(){this.setSelectionRange?this.setSelectionRange(e,t):this.createTextRange&&(n=this.createTextRange(),n.collapse(!0),n.moveEnd("character",t),n.moveStart("character",e),n.select())})):(this[0].setSelectionRange?(e=this[0].selectionStart,t=this[0].selectionEnd):document.selection&&document.selection.createRange&&(n=document.selection.createRange(),e=0-n.duplicate().moveStart("character",-1e5),t=e+n.text.length),{begin:e,end:t})},unmask:function(){return this.trigger("unmask")},mask:function(t,r){var c,l,s,u,f,h;return!t&&this.length>0?(c=e(this[0]),c.data(e.mask.dataName)()):(r=e.extend({placeholder:e.mask.placeholder,completed:null},r),l=e.mask.definitions,s=[],u=h=t.length,f=null,e.each(t.split(""),function(e,t){"?"==t?(h--,u=e):l[t]?(s.push(RegExp(l[t])),null===f&&(f=s.length-1)):s.push(null)}),this.trigger("unmask").each(function(){function c(e){for(;h>++e&&!s[e];);return e}function d(e){for(;--e>=0&&!s[e];);return e}function m(e,t){var n,a;if(!(0>e)){for(n=e,a=c(t);h>n;n++)if(s[n]){if(!(h>a&&s[n].test(R[a])))break;R[n]=R[a],R[a]=r.placeholder,a=c(a)}b(),x.caret(Math.max(f,e))}}function p(e){var t,n,a,i;for(t=e,n=r.placeholder;h>t;t++)if(s[t]){if(a=c(t),i=R[t],R[t]=n,!(h>a&&s[a].test(i)))break;n=i}}function g(e){var t,n,a,r=e.which;8===r||46===r||i&&127===r?(t=x.caret(),n=t.begin,a=t.end,0===a-n&&(n=46!==r?d(n):a=c(n-1),a=46===r?c(a):a),k(n,a),m(n,a-1),e.preventDefault()):27==r&&(x.val(S),x.caret(0,y()),e.preventDefault())}function v(t){var n,a,i,l=t.which,u=x.caret();t.ctrlKey||t.altKey||t.metaKey||32>l||l&&(0!==u.end-u.begin&&(k(u.begin,u.end),m(u.begin,u.end-1)),n=c(u.begin-1),h>n&&(a=String.fromCharCode(l),s[n].test(a)&&(p(n),R[n]=a,b(),i=c(n),o?setTimeout(e.proxy(e.fn.caret,x,i),0):x.caret(i),r.completed&&i>=h&&r.completed.call(x))),t.preventDefault())}function k(e,t){var n;for(n=e;t>n&&h>n;n++)s[n]&&(R[n]=r.placeholder)}function b(){x.val(R.join(""))}function y(e){var t,n,a=x.val(),i=-1;for(t=0,pos=0;h>t;t++)if(s[t]){for(R[t]=r.placeholder;pos++<a.length;)if(n=a.charAt(pos-1),s[t].test(n)){R[t]=n,i=t;break}if(pos>a.length)break}else R[t]===a.charAt(pos)&&t!==u&&(pos++,i=t);return e?b():u>i+1?(x.val(""),k(0,h)):(b(),x.val(x.val().substring(0,i+1))),u?t:f}var x=e(this),R=e.map(t.split(""),function(e){return"?"!=e?l[e]?r.placeholder:e:void 0}),S=x.val();x.data(e.mask.dataName,function(){return e.map(R,function(e,t){return s[t]&&e!=r.placeholder?e:null}).join("")}),x.attr("readonly")||x.one("unmask",function(){x.unbind(".mask").removeData(e.mask.dataName)}).bind("focus.mask",function(){clearTimeout(n);var e;S=x.val(),e=y(),n=setTimeout(function(){b(),e==t.length?x.caret(0,e):x.caret(e)},10)}).bind("blur.mask",function(){y(),x.val()!=S&&x.change()}).bind("keydown.mask",g).bind("keypress.mask",v).bind(a,function(){setTimeout(function(){var e=y(!0);x.caret(e),r.completed&&e==x.val().length&&r.completed.call(x)},0)}),y()}))}})})(jQuery); 
</script>
</div>
<script type="text/javascript">
jQuery(".cep").mask("99999-999");
</script> 
<script type="text/javascript"><!--
var row = <?php echo $row; ?>;

function addRow() {
  html  = '<tbody id="frete' + row + '">';
  html += '<tr>';
  html += '<td class="text-left"><input type="text" class="form-control" name="personalizado_fretes[' + row + '][nome]" maxlength="150" /></td>';
  html += '<td class="text-right"><div class="input-group"><span class="input-group-addon">R$</span><input type="text" class="form-control" size="2" name="personalizado_fretes[' + row + '][valor]" value="0.00" onblur="prepararFloat(this);" /></div></td>';
  html += '<td class="text-right"><input type="text" class="form-control cep" id="cepInicial" name="personalizado_fretes[' + row + '][cepInicial]" /></td>';
  html += '<td class="text-right"><input type="text" class="form-control cep" id="cepFinal" name="personalizado_fretes[' + row + '][cepFinal]" /></td>';
  html += '<td class="text-right"><div class="input-group"><span class="input-group-addon">R$</span><input type="text" class="form-control" name="personalizado_fretes[' + row + '][valor_min]" onblur="prepararFloat(this);" /></div></td>';
  html += '<td class="text-right"><div class="input-group"><span class="input-group-addon">R$</span><input type="text" class="form-control" name="personalizado_fretes[' + row + '][valor_max]" onblur="prepararFloat(this);" /></div></td>';

  html += '<td class="text-left"><a onclick="$(\'#frete' + row + '\').remove();" class="btn btn-danger"><?php echo $button_remove; ?></a></td>';
  html += '</tr>';
  html += '</tbody>';
  
  $('#frete-list > tfoot').before(html);
  jQuery(".cep").mask("99999-999");
  
  $('#frete-list > tbody:last input[type="text"]:first').focus();
  row++;
}
//--></script>
<script type="text/javascript"><!--
function prepararFloat(el) {
  el.value = el.value.replace(/\,/g, '.');
  var posDecimal = el.value.lastIndexOf('.');
  if (posDecimal > 0) {
    var r = el.value.substr(0, posDecimal);
    r = r.replace(/\./g, '');
    r += el.value.substr(posDecimal);
    el.value = r;
  }
}
$('input.float').on('blur', function() {prepararFloat(this);});
//--></script>
<?php echo $footer; ?>