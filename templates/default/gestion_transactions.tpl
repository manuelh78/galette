		<h1 class="titre">{_T string="Management of transactions"}</h1>
		<form action="gestion_transactions.php" method="get" name="filtre">
		<table class="infoline" width="100%">
			<tr>
				<td class="left">{$nb_transactions} {if $nb_transactions > 1}{_T string="transactions"}{else}{_T string="transaction"}{/if}</td>
				<td class="center">
					{_T string="Show:"}
					<select name="nbshow" onchange="form.submit()">
						{html_options options=$nbshow_options selected=$numrows}
					</select>
				</td>
				<td class="right">{_T string="Pages:"}
					<span class="pagelink">
					{section name="pageLoop" start=1 loop=$nb_pages+1}
						{if $smarty.section.pageLoop.index eq $page}
							{$smarty.section.pageLoop.index}
						{else}
							<a href="gestion_transactions.php?nbshow={$smarty.get.nbshow}&page={$smarty.section.pageLoop.index}">{$smarty.section.pageLoop.index}</a>
						{/if}
					{/section}
					</span>
				</td>
			</tr>
		</table>
		</form>
		<table width="100%">
			<tr>
				<th width="15" class="listing">#</th>
				<th class="listing left">
					<a href="gestion_transactions.php?tri=0" class="listing">{_T string="Date"}</a>
					{if $smarty.session.sort_by eq 0}
					{if $smarty.session.sort_direction eq 0}
					<img src="{$template_subdir}images/asc.png" width="7" height="7" alt=""/>
					{else}
					<img src="{$template_subdir}images/desc.png" width="7" height="7" alt=""/>
					{/if}
					{else}
					<img src="{$template_subdir}images/icon-empty.png" width="7" height="7" alt=""/>
					{/if}
				</th>
				<th class="listing left">{_T string="Description"}</th>
{if $smarty.session.admin_status eq 1}
				<th class="listing left">
					<a href="gestion_transactions.php?tri=1" class="listing">{_T string="Originator"}</a>
					{if $smarty.session.sort_by eq 1}
					{if $smarty.session.sort_direction eq 0}
					<img src="{$template_subdir}images/asc.png" width="7" height="7" alt=""/>
					{else}
					<img src="{$template_subdir}images/desc.png" width="7" height="7" alt=""/>
					{/if}
					{else}
					<img src="{$template_subdir}images/icon-empty.png" width="7" height="7" alt=""/>
					{/if}
				</th>
{/if}
				<th class="listing left">
					<a href="gestion_transactions.php?tri=2" class="listing">{_T string="Amount"}</a>
					{if $smarty.session.sort_by eq 3}
					{if $smarty.session.sort_direction eq 0}
					<img src="{$template_subdir}images/asc.png" width="7" height="7" alt=""/>
					{else}
					<img src="{$template_subdir}images/desc.png" width="7" height="7" alt=""/>
					{/if}
					{else}
					<img src="{$template_subdir}images/icon-empty.png" width="7" height="7" alt=""/>
					{/if}
				</th>
{if $smarty.session.admin_status eq 1}
				<th width="55" class="listing">{_T string="Actions"}</th>
{/if}
			</tr>
{foreach from=$transactions item=transaction}
			<tr>
				<td width="15" class="cotis-ok center" nowrap="nowrap">{$transaction.trans_id}</td>
				<td width="50" class="cotis-ok" nowrap="nowrap">
					{$transaction.trans_date}
				</td>
				<td class="cotis-ok" nowrap="nowrap">
					{$transaction.trans_desc}
				</td>
{if $smarty.session.admin_status eq 1}
			<td class="cotis-ok" nowrap="nowrap">
{if $smarty.session.id_adh eq ""}
				<a href="gestion_transactions.php?id_adh={$transaction.id_adh}">
					{$transaction.lastname} {$transaction.firstname}
				</a>
{else}
				<a href="voir_adherent.php?id_adh={$transaction.id_adh}">
					{$transaction.lastname} {$transaction.firstname}
				</a>
{/if}
			</td>
{/if}
			<td class="cotis-ok" nowrap="nowrap">{$transaction.trans_amount}</td>
{if $smarty.session.admin_status eq 1}
			<td width="55" class="cotis-ok center" nowrap="nowrap">
				<a href="ajouter_transaction.php?trans_id={$transaction.trans_id}"><img src="{$template_subdir}images/icon-edit.png" alt="{_T string="[mod]"}" border="0" width="12" height="13"/></a>
				<a onclick="return confirm('{_T string="Do you really want to delete this transaction of the database ?"|escape:"javascript"}')" href="gestion_transactions.php?sup={$transaction.trans_id}"><img src="{$template_subdir}images/icon-trash.png" alt="{_T string="[del]"}" border="0" width="11" height="13"/></a>
			</td>
{/if}
		</tr>
{foreachelse}
{if $smarty.session.admin_status eq 1}
			<tr><td colspan="6" class="emptylist">{_T string="no transaction"}</td></tr>
{else}
			<tr><td colspan="4" class="emptylist">{_T string="no transaction"}</td></tr>
{/if}
{/foreach}
		</table>
		<div class="infoline2 right">
			{_T string="Pages:"}
			<span class="pagelink">
			{section name="pageLoop" start=1 loop=$nb_pages+1}
			{if $smarty.section.pageLoop.index eq $page}
			{$smarty.section.pageLoop.index}
			{else}
			<a href="gestion_transactions.php?nbshow={$smarty.get.nbshow}&page={$smarty.section.pageLoop.index}">{$smarty.section.pageLoop.index}</a>
			{/if}
			{/section}
			</span>
		</div>
