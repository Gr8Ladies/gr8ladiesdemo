<%@ page import="gr8ladiesdemo.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${userInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'chapter', 'error')} required">
	<label for="chapter">
		<g:message code="user.chapter.label" default="Chapter" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="chapter" name="chapter.id" from="${gr8ladiesdemo.Chapter.list()}" optionKey="id" required="" value="${userInstance?.chapter?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="user.gender.label" default="Gender" />
		
	</label>
	<g:textField name="gender" value="${userInstance?.gender}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${userInstance?.lastName}"/>
</div>

