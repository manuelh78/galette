{extends file="public_page.tpl"}

{block name="content"}
{if $members|@count > 0}
        <div class="ui icon yellow small message">
            <i class="info circle icon"></i>
            <div class="content">
                {_T string="This page shows only members who have choosen to be visible on the public lists and are up-to-date within their contributions. If you want your account to be visible here, edit your profile and check 'Be visible in the members list'"}
            </div>
        </div>
        <form action="{path_for name="filterPublicList" data=["type" => "list"]}" method="POST" id="filtre" class="ui form">
            <div class="infoline">
                <div class="ui basic horizontal segments">
                    <div class="ui basic fitted segment">
                        <div class="ui label">{_T string="%count member" plural="%count members" count=$nb_members pattern="/%count/" replace=$nb_members}</div>
                    </div>
                    <div class="ui basic right aligned fitted segment">
                        <div class="inline field">
                            <label for="nbshow">{_T string="Records per page:"}</label>
                            <select name="nbshow" id="nbshow" class="ui dropdown nochosen">
                                {html_options options=$nbshow_options selected=$numrows}
                            </select>
                            <noscript> <span><input type="submit" value="{_T string="Change"}" /></span></noscript>
                            {include file="forms_types/csrf.tpl"}
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <table class="ui celled table">
            <thead>
                <tr>
                    <th class="left">
                        <a href="{path_for name="publicList" data=["type" => "list", "option" => "order", "value" => {Galette\Repository\Members::ORDERBY_NAME}]}" class="listing">
                            {_T string="Name"}
                            {if $filters->orderby eq constant('Galette\Repository\Members::ORDERBY_NAME')}
                                {if $filters->ordered eq constant('Galette\Filters\MembersList::ORDER_ASC')}
                            <img src="{base_url}/{$template_subdir}images/down.png" width="10" height="6" alt=""/>
                                {else}
                            <img src="{base_url}/{$template_subdir}images/up.png" width="10" height="6" alt=""/>
                                {/if}
                            {/if}
                        </a>
                    </th>
                    <th class="left">
                        <a href="{path_for name="publicList" data=["type" => "list", "option" => "order", "value" => {Galette\Repository\Members::ORDERBY_NICKNAME}]}" class="listing">
                            {_T string="Nickname"}
                            {if $filters->orderby eq constant('Galette\Repository\Members::ORDERBY_NICKNAME')}
                                {if $filters->ordered eq constant('Galette\Filters\MembersList::ORDER_ASC')}
                            <img src="{base_url}/{$template_subdir}images/down.png" width="10" height="6" alt=""/>
                                {else}
                            <img src="{base_url}/{$template_subdir}images/up.png" width="10" height="6" alt=""/>
                                {/if}
                            {/if}
                        </a>
                    </th>
                    {if $login->isLogged()}
                    <th class="left">
                        {_T string="Email"}
                    </th>
                    {/if}
                    <th class="left">
                        {_T string="Information"}
                    </th>
                </tr>
            </thead>
            <tbody>
    {foreach from=$members item=member name=allmembers}
                <tr class="{if $smarty.foreach.allmembers.iteration % 2 eq 0}even{else}odd{/if}">
                    <td class="{$member->getRowClass(true)} nowrap username_row" data-scope="row">
                    {if $member->isCompany()}
                        <img src="{base_url}/{$template_subdir}images/icon-company.png" alt="" width="16" height="16"/>
                    {elseif $member->isMan()}
                        <img src="{base_url}/{$template_subdir}images/icon-male.png" alt="" width="16" height="16"/>
                    {elseif $member->isWoman()}
                        <img src="{base_url}/{$template_subdir}images/icon-female.png" alt="" width="16" height="16"/>
                    {else}
                        <img src="{base_url}/{$template_subdir}images/icon-empty.png" alt="" width="10" height="12"/>
                    {/if}

                    {if $member->website ne ''}
                        <a href="{$member->website}">{$member->sfullname}</a>
                    {else}
                        {$member->sfullname}
                    {/if}
                    </td>
                    <td class="{$member->getRowClass(true)} nowrap" data-title="{_T string="Nickname"}">{$member->nickname|htmlspecialchars}</td>
                    {if $login->isLogged()}
                    <td class="{$member->getRowClass(true)} nowrap" data-title="{_T string="Email"}"><a href="mailto:{$member->email}">{$member->email}</a></td>
                    {/if}
                    <td class="{$member->getRowClass(true)} nowrap" data-title="{_T string="Information"}">{$member->others_infos}</td>
                </tr>
    {/foreach}
            </tbody>
        </table>
        <div class="ui basic center aligned fitted segment">
            <div class="ui inverted pagination menu">
                <div class="header item">
                    {_T string="Pages:"}
                </div>
                {$pagination}
            </div>
        </div>
{else}
    <div class="ui icon info small message">
        <i class="info icon"></i>
        <div class="content">
            <div class="header">
                {_T string="No member to show"}
            </div>
        </div>
    </div>
{/if}
{/block}
