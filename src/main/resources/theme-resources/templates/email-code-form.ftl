<#import "template.ftl" as layout>
    <@layout.registrationLayout displayMessage=!messagesPerField.existsError('emailCode'); section>
        <#if section="header">
            ${msg("enterVerificationCode")}
            <#elseif section="form">
                <form id="kc-otp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}"
                    method="post">
                    <div class="kc-info-wrapper">
                        ${msg("verificationEmailInstructions")}
                    </div>
                    <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="emailCode" class="${properties.kcLabelClass!}">
                                ${msg("emailOtpForm")}
                            </label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input id="emailCode" name="emailCode" type="text" class="${properties.kcInputClass!}"
                                autofocus aria-invalid="<#if messagesPerField.existsError('emailCode')>true</#if>" />
                            <#if messagesPerField.existsError('emailCode')>
                                <span id="input-error-otp-code" class="${properties.kcInputErrorMessageClass!}"
                                    aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('emailCode'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </div>
                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-buttons">
                            <div class="${properties.kcFormButtonsWrapperClass!}">
                                <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} ${properties.kcButtonBlockClass!}" name="login" type="submit" value="${msg("doLogIn")}" />
                            </div>
                        </div>
                        <div id="kc-registration-container" class="pf-v5-c-login__main-footer-band">
                            <div class="${properties.kcFormButtonsWrapperClass!}">
                                <input class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="resend" type="submit" value="${msg("resendCode")}" />
                                <input class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="cancel" type="submit" value="${msg("doCancel")}" />
                            </div>
                        </div>
                    </div>
                </form>
        </#if>
    </@layout.registrationLayout>