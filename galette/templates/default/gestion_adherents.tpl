		<h1 class="titre">{_T string="Management of members"}</h1>
		<form action="gestion_adherents.php" method="get" name="filtre">
{if $error_detected|@count != 0}
		<div id="errorbox">
			<h1>{_T string="- ERROR -"}</h1>
			<ul>
{foreach from=$error_detected item=error}
				<li>{$error}</li>
{/foreach}
			</ul>
		</div>
{/if}
		<div id="listfilter">
			<label for="filtre_nom">{_T string="Search:"}&nbsp;</label>
			<input type="text" name="filtre_nom" id="filtre_nom" value="{$smarty.session.filtre_adh_nom}"/>&nbsp;
		 	{_T string="in:"}&nbsp;
			<select name="filtre_fld">
				{html_options options=$filtre_fld_options selected=$smarty.session.filtre_adh_fld}
			</select>
		 	{_T string="among:"}&nbsp;
			<select name="filtre" onchange="form.submit()">
				{html_options options=$filtre_options selected=$smarty.session.filtre_adh}
			</select>
			<select name="filtre_2" onchange="form.submit()">
				{html_options options=$filtre_2_options selected=$smarty.session.filtre_adh_2}
			</select>
			<input type="submit" class="submit" value="{_T string="Filter"}"/>
		</div>
		<table class="infoline" width="100%">
			<tr>
				<td class="left">{$nb_members} {if $nb_members != 1}{_T string="members"}{else}{_T string="member"}{/if}</td>
				<td class="center">
					{_T string="Show:"}
					<select name="nbshow" onchange="form.submit()">
						{html_options options=$nbshow_options selected=$numrows}
					</select>
				</td>
			</tr>
		</table>
		</form>
		<form action="gestion_adherents.php" method="post" name="listform">
		<table width="100%" id="listing">
			<tr>
				<th width="15" class="listing">#</th>
	  			<th width="250" class="listing left">
					<a href="gestion_adherents.php?tri=0" class="listing">{_T string="Name"}</a>
					{if $smarty.session.tri_adh eq 0}
					{if $smarty.session.tri_adh_sens eq 0}
					<img src="{$template_subdir}images/asc.png" width="7" height="7" alt=""/>
					{else}
					<img src="{$template_subdir}images/desc.png" width="7" height="7" alt=""/>
					{/if}
					{else}
					<img src="{$template_subdir}images/icon-empty.png" width="7" height="7" alt=""/>
					{/if}
				</th>
				<th class="listing left" nowrap="nowrap">
					<a href="gestion_adherents.php?tri=1" class="listing">{_T string="Nickname"}</a>
					{if $smarty.session.tri_adh eq 1}
					{if $smarty.session.tri_adh_sens eq 0}
					<img src="{$template_subdir}images/asc.png" width="7" height="7" alt=""/>
					{else}
					<img src="{$template_subdir}images/desc.png" width="7" height="7" alt=""/>
					{/if}
					{else}
					<img src="{$template_subdir}images/icon-empty.png" width="7" height="7" alt=""/>
					{/if}
				</th>
				<th class="listing left">
					<a href="gestion_adherents.php?tri=2" class="listing">{_T string="Status"}</a>
					{if $smarty.session.tri_adh eq 2}
					{if $smarty.session.tri_adh_sens eq 0}
					<img src="{$template_subdir}images/asc.png" width="7" height="7" alt=""/>
					{else}
					<img src="{$template_subdir}images/desc.png" width="7" height="7" alt=""/>
					{/if}
					{else}
					<img src="{$template_subdir}images/icon-empty.png" width="7" height="7" alt=""/>
					{/if}
				</th>
				<th class="listing left">
					<a href="gestion_adherents.php?tri=3" class="listing">{_T string="State of dues"}</a>
					{if $smarty.session.tri_adh eq 3}
					{if $smarty.session.tri_adh_sens eq 0}
					<img src="{$template_subdir}images/asc.png" width="7" height="7" alt=""/>
					{else}
					<img src="{$template_subdir}images/desc.png" width="7" height="7" alt=""/>
					{/if}
					{else}
					<img src="{$template_subdir}images/icon-empty.png" width="7" height="7" alt=""/>
					{/if}
				</th>
				<th width="55" class="listing">{_T string="Actions"}</th>
			</tr>
{foreach from=$members item=member key=ordre}
			<tr>
				<td width="15" class="{$member.class}">{$ordre}</td>
				<td class="{$member.class}" nowrap="nowrap">
					<input type="checkbox" name="member_sel[]" value="{$member.id_adh}"/>
				{if $member.genre eq 1}
					<img src="{$template_subdir}images/icon-male.png" Alt="{_T string="[M]"}" align="middle" width="10" height="12"/>
				{elseif $member.genre eq 2 || $member.genre eq 3}
					<img src="{$template_subdir}images/icon-female.png" Alt="{_T string="[W]"}" align="middle" width="10" height="12"/>
				{else}
					<img src="{$template_subdir}images/icon-empty.png" Alt="" align="middle" width="10" height="12"/>
				{/if}
				{if $member.email != ''}
					<a href="mailto:{$member.email}"><img src="{$template_subdir}images/icon-mail.png" Alt="{_T string="[Mail]"}" align="middle" border="0" width="14" height="10"/></a>
				{else}
					<img src="{$template_subdir}images/icon-empty.png" Alt="" align="middle" border="0" width="14" height="10"/>
				{/if}
				{if $member.admin eq 1}
					<img src="{$template_subdir}images/icon-star.png" Alt="{_T string="[admin]"}" align="middle" width="12" height="13"/>
				{else}
					<img src="{$template_subdir}images/icon-empty.png" Alt="" align="middle" width="12" height="13"/>
				{/if}
				<a href="voir_adherent.php?id_adh={$member.id_adh}">{$member.nom} {$member.prenom}</a>
				</td>
				<td class="{$member.class}" nowrap="nowrap">{$member.pseudo}</td>
				<td class="{$member.class}" nowrap="nowrap">{$member.statut}</td>
				<td class="{$member.class}" nowrap="nowrap">{$member.statut_cotis}</td>
				<td class="{$member.class} center">
					<a href="ajouter_adherent.php?id_adh={$member.id_adh}"><img src="{$template_subdir}images/icon-edit.png" alt="{_T string="[mod]"}" border="0" width="12" height="13"/></a>
					<a href="gestion_contributions.php?id_adh={$member.id_adh}"><img src="{$template_subdir}images/icon-money.png" alt="{_T string="[$]"}" border="0" width="13" height="13"/></a>
					<a onclick="return confirm('{_T string="Do you really want to delete this member from the base? This will also delete the history of his fees. You could instead disable the account.\n\nDo you still want to delete this member ?"|escape:"javascript"}')" href="gestion_adherents.php?sup={$member.id_adh}"><img src="{$template_subdir}images/icon-trash.png" alt="{_T string="[del]"}" border="0" width="11" height="13"/></a>
				</td>
			</tr>
{foreachelse}
			<tr><td colspan="6" class="emptylist">{_T string="no member"}</td></tr>
{/foreach}
		</table>
{if $nb_members != 0}
		{literal}
		<script type="text/javascript">
		//<![CDATA[
		var checked = 1;
		function check()
		{
			for (var i=0;i<document.forms.listform.elements.length;i++)
			{
				var e = document.forms.listform.elements[i];
				if(e.type == "checkbox")
				{
					e.checked = checked;
				}
			}
			checked = !checked;
			return(false);
		}
		//]]>
		</script>
		{/literal}
{/if}
		<table class="infoline" width="100%">
			<tr>
{if $nb_members != 0}
				<td class="left" nowrap="nowrap">
					<a href="#" onclick="check();">{_T string="(Un)Check all"}</a>
				</td>
{/if}
			</tr>
			<tr>
				<td colspan="6" class="center" id="table_footer">
					{_T string="Pages:"}<br/>
					<ul class="pages">{$pagination}</ul>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<ul>
						<li>{_T string="Selection:"}</li>
						<li><input type="submit" class="submit" onclick="return confirm('{_T string="Do you really want to delete all selected accounts (and related contributions)?"|escape:"javascript"}');" name="delete" value="{_T string="Delete"}"/></li>
						<li><input type="submit" class="submit" name="mailing" value="{_T string="Mail all"}"/></li>
						<li><input type="submit" class="submit" name="labels" value="{_T string="Generate labels"}"/></li>
					</ul>
				</td>
			</tr>
		</table>
		</form>
