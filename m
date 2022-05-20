Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5397E
	for <chrome-platform@lists.linux.dev>; Fri, 20 May 2022 15:29:21 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id y199so8039698pfb.9
        for <chrome-platform@lists.linux.dev>; Fri, 20 May 2022 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bQXzIo9ckva6G/ZcC8rPAUx7ZPhN3Zb8y3Z1L1PXiyU=;
        b=J20PHEYxmRCzb89gR7QlS9bFp98iY/j5yKWxBuFfBqsFeU1LNkOnADp3JoN/L35nQV
         AXS5CI/ZzUSW/3x52C5ScfNb2XvgSGbHFa2xxoJXWfsXJC6X7A/fOLRaHAKpffUwm771
         bOf5GbBrEBbFmIoUo+cDa1qb7CWe8Sg2Y4u5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bQXzIo9ckva6G/ZcC8rPAUx7ZPhN3Zb8y3Z1L1PXiyU=;
        b=tWC8YhsVtHklf7Snh1ZJfHo2BHDvouC3GE7UxHHE5x/ohsiraAfyz7wbYObvhKsgZX
         qMP3WWMBlU+6VaG0jEyw4bnoOL+UoJtDWmUS8f6IdQKZn3oTYYbLMEGS/TVDXepZwEKy
         /cA+/kEb5/rCQ4AXtjwEuRy/5FHuhn1+bzl0C/JLMPmaQ1CDz9Iji99TRYCd4cwwC6+/
         bE2eXJBT4Zx7QDdOtDn1GKIy3JzcyRUr1ty+Qb+uy011yj/N4ww7nPQbOz7dOEizC+/w
         /udnRoN4ypryzNRLFQtYvfgPlZ1wJ9N5sH4fP7lNUnv/C9pidz4OyvNhqawiv1mqLEIV
         eXRQ==
X-Gm-Message-State: AOAM533J1iQU227K/OISs1NXVmSKQ0ilWAIOKAkrEcOtdCeWtIisnyx5
	UHW9cQe6e9oJoezl7zaMS36YlA==
X-Google-Smtp-Source: ABdhPJz2G97WiSo4fI9WPH+8M+Zn+mODh4vK9XNKFG5aCH6g5DHAXGRM0OR7/ye5WnneaI42stYMCQ==
X-Received: by 2002:a05:6a00:2985:b0:510:66a4:375d with SMTP id cj5-20020a056a00298500b0051066a4375dmr10858560pfb.18.1653060561157;
        Fri, 20 May 2022 08:29:21 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:5332:2096:60a3:3455])
        by smtp.gmail.com with UTF8SMTPSA id a9-20020a170902710900b0015e8d4eb1c6sm5777273pll.16.2022.05.20.08.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 08:29:20 -0700 (PDT)
Date: Fri, 20 May 2022 08:29:19 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] platform/chrome: cros_kbd_led_backlight: support
 EC PWM backend
Message-ID: <YoezzzLdVfb0K7Ak@google.com>
References: <20220321085547.1162312-1-tzungbi@kernel.org>
 <20220321085547.1162312-6-tzungbi@kernel.org>
 <YobHVST2Nfn+z8n6@google.com>
 <YocewB/lLJhIAuQP@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YocewB/lLJhIAuQP@google.com>

On Fri, May 20, 2022 at 12:53:20PM +0800, Tzung-Bi Shih wrote:
> On Thu, May 19, 2022 at 03:40:21PM -0700, Matthias Kaehlcke wrote:
> > On Mon, Mar 21, 2022 at 04:55:47PM +0800, Tzung-Bi Shih wrote:
> > > +struct keyboard_led_private {
> > 
> > Why 'private', isn't this more a 'cros_ec_kdb_bl' or similar?
> 
> It is just drvdata.

The data structure represents an instance of the device, as such it
is an important part of the driver, drvdata is just a way to attach
it to the platform device.

> I would prefer to keep the original prefix "keyboard_led_" if you wouldn't
> have strong opinion.

I'm fine with 'keyboard_led', but object to the 'private' part. In the
kernel 'private' fields are typically used when a driver consists of a
generic part and a device specific part. The driver has a 'private'
void* field that points to a device specific data structure about which
the generic driver is agnostic. This data structure is only used by the
device specific implementation. That isn't the case here, so naming the
structure anything 'private' is misleading.

> > > +static int
> > > +keyboard_led_set_brightness_blocking_ec_pwm(struct led_classdev *cdev,
> > > +					    enum led_brightness brightness)
> > 
> > nit: since there is only a blocking version of .set_brightness you could omit
> > 'blocking' in the function name.
> 
> Ack, will fix it in next version.
> 
> > > +	struct {
> > > +		struct cros_ec_command msg;
> > > +		struct ec_params_pwm_set_keyboard_backlight params;
> > > +	} __packed buf;
> > > +	struct ec_params_pwm_set_keyboard_backlight *params = &buf.params;
> > > +	struct cros_ec_command *msg = &buf.msg;
> > > +	struct keyboard_led_private *private =

Continuation of the argument above: the variable name 'private' doesn't
reveal anything about it's nature, something like 'kbd_led' would be much
clearer.

> > > +		container_of(cdev, struct keyboard_led_private, cdev);
> > > +
> > > +	memset(&buf, 0, sizeof(buf));
> > > +
> > > +	msg->version = 0;
> > 
> > not strictly needed since you do the memset above, I guess it's
> > fine to keep the assignment if you want to be explicit about the
> > version.
> 
> Ack, let's remove them in next version.
> 
> > > +static int keyboard_led_init_ec_pwm(struct platform_device *pdev)
> > > +{
> > > +	struct keyboard_led_private *private = platform_get_drvdata(pdev);
> > > +
> > > +	private->ec = dev_get_drvdata(pdev->dev.parent);
> > > +	if (!private->ec) {
> > > +		dev_err(&pdev->dev, "no parent EC device\n");
> > > +		return -EINVAL;
> > > +	}
> > 
> > The only thing this 'init' function does is assigning private->ec. Wouldn't
> > it be clearer to do this directly in probe() from where callback is called?
> > It could be with the condition that the device as a DT node.
> 
> No.  The probe() isn't aware of the device is from ACPI or OF.

But it could be:

	if (pdev->dev.of_node)
		kbd_led->ec = dev_get_drvdata(pdev->dev.parent);

> > Is it actually possible that the keyboard backlight device gets instantiated
> > if there is no EC parent?
> 
> It shouldn't be but just in case.

If this can only occur due to an error in common kernel frameworks then
the check should be omitted IMO.

> > > +static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm = {
> > > +	.init = keyboard_led_init_ec_pwm_null,
> > 
> > Is this really needed?
> > 
> > keyboard_led_probe() checks if .init is assigned before invoking the callback:
> > 
> > 	if (drvdata->init) {
> > 		error = drvdata->init(pdev);
> > 
> > The whole 'else' branch could be eliminated if .of_match_table of the driver
> > only is assigned when CONFIG_CROS_KBD_LED_BACKLIGHT_EC_PWM is set. IMO that
> > would preferable over creating 'stubs'.
> 
> CONFIG_CROS_KBD_LED_BACKLIGHT_EC_PWM and CONFIG_OF are independent.  The stubs
> were created to avoid compile errors if CONFIG_OF=y but
> CONFIG_CROS_KBD_LED_BACKLIGHT_EC_PWM=n.

Is there functional version of the driver that uses instantiation through the
device tree if CONFIG_CROS_KBD_LED_BACKLIGHT_EC_PWM=n? If not .of_match_table
should not be assigned.

> However, I just realized it could also have compile errors if CONFIG_OF=n and
> CONFIG_CROS_KBD_LED_BACKLIGHT_EC_PWM=y.  The `keyboard_led_drvdata_ec_pwm` is
> unused.
> 
> In any case, I agree with you.  Let's remove the stubs in next version.  I
> would use __maybe_unused for some of them.
