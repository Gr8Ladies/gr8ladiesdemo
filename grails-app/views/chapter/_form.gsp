<%@ page import="gr8ladiesdemo.Chapter" %>



<div class="fieldcontain ${hasErrors(bean: chapterInstance, field: 'members', 'error')} ">
	<label for="members">
		<g:message code="chapter.members.label" default="Members" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${chapterInstance?.members?}" var="m">
    <li><g:link controller="user" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="user" action="create" params="['chapter.id': chapterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'user.label', default: 'User')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: chapterInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="chapter.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${chapterInstance?.name}"/>
</div>

