Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228B715A9
	for <chrome-platform@lists.linux.dev>; Fri, 20 May 2022 04:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73763C385A9;
	Fri, 20 May 2022 04:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653022403;
	bh=APGPDdy5nqlALidXofvxDcr/grRV+XFXUdq+7hIgFnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMwCVIFwPEg43th+Ec07N5q1FIq7SvUByh3BajNgz7VUy4ECUHHdgiUhKE6xuOkNh
	 q0Y28OIeHsmPc/ir6DY44uQ+5+TG+Rjcypu/mLzFw9wgV/dBKNyhwWOZH1oEbGqVaa
	 RCSAhy6b4NBNuk/Lp1pBqoUfAx9wvyQ43+3YtTJAXIZAcpAMSmOXuRA7S8P0XvCdPW
	 WoyMnB03t5mpdbs9+DoCac5+CztvI0ob3/F0unW7gFkKMaXNLcmmWJDhxGLRkaiF+F
	 ckqlOcZZ3x56i32XoahQMSzi2TXcf/xtaR8YUdotQ9hlF+GolZY/ggmvnw+W5w5fiQ
	 tjazeBW1uq9Ow==
Date: Fri, 20 May 2022 12:53:20 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] platform/chrome: cros_kbd_led_backlight: support
 EC PWM backend
Message-ID: <YocewB/lLJhIAuQP@google.com>
References: <20220321085547.1162312-1-tzungbi@kernel.org>
 <20220321085547.1162312-6-tzungbi@kernel.org>
 <YobHVST2Nfn+z8n6@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YobHVST2Nfn+z8n6@google.com>

On Thu, May 19, 2022 at 03:40:21PM -0700, Matthias Kaehlcke wrote:
> On Mon, Mar 21, 2022 at 04:55:47PM +0800, Tzung-Bi Shih wrote:
> > +struct keyboard_led_private {
> 
> Why 'private', isn't this more a 'cros_ec_kdb_bl' or similar?

It is just drvdata.  I would prefer to keep the original prefix
"keyboard_led_" if you wouldn't have strong opinion.

> > +static int
> > +keyboard_led_set_brightness_blocking_ec_pwm(struct led_classdev *cdev,
> > +					    enum led_brightness brightness)
> 
> nit: since there is only a blocking version of .set_brightness you could omit
> 'blocking' in the function name.

Ack, will fix it in next version.

> > +	struct {
> > +		struct cros_ec_command msg;
> > +		struct ec_params_pwm_set_keyboard_backlight params;
> > +	} __packed buf;
> > +	struct ec_params_pwm_set_keyboard_backlight *params = &buf.params;
> > +	struct cros_ec_command *msg = &buf.msg;
> > +	struct keyboard_led_private *private =
> > +		container_of(cdev, struct keyboard_led_private, cdev);
> > +
> > +	memset(&buf, 0, sizeof(buf));
> > +
> > +	msg->version = 0;
> 
> not strictly needed since you do the memset above, I guess it's
> fine to keep the assignment if you want to be explicit about the
> version.

Ack, let's remove them in next version.

> > +static int keyboard_led_init_ec_pwm(struct platform_device *pdev)
> > +{
> > +	struct keyboard_led_private *private = platform_get_drvdata(pdev);
> > +
> > +	private->ec = dev_get_drvdata(pdev->dev.parent);
> > +	if (!private->ec) {
> > +		dev_err(&pdev->dev, "no parent EC device\n");
> > +		return -EINVAL;
> > +	}
> 
> The only thing this 'init' function does is assigning private->ec. Wouldn't
> it be clearer to do this directly in probe() from where callback is called?
> It could be with the condition that the device as a DT node.

No.  The probe() isn't aware of the device is from ACPI or OF.

> Is it actually possible that the keyboard backlight device gets instantiated
> if there is no EC parent?

It shouldn't be but just in case.

> > +static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm = {
> > +	.init = keyboard_led_init_ec_pwm_null,
> 
> Is this really needed?
> 
> keyboard_led_probe() checks if .init is assigned before invoking the callback:
> 
> 	if (drvdata->init) {
> 		error = drvdata->init(pdev);
> 
> The whole 'else' branch could be eliminated if .of_match_table of the driver
> only is assigned when CONFIG_CROS_KBD_LED_BACKLIGHT_EC_PWM is set. IMO that
> would preferable over creating 'stubs'.

CONFIG_CROS_KBD_LED_BACKLIGHT_EC_PWM and CONFIG_OF are independent.  The stubs
were created to avoid compile errors if CONFIG_OF=y but
CONFIG_CROS_KBD_LED_BACKLIGHT_EC_PWM=n.

However, I just realized it could also have compile errors if CONFIG_OF=n and
CONFIG_CROS_KBD_LED_BACKLIGHT_EC_PWM=y.  The `keyboard_led_drvdata_ec_pwm` is
unused.

In any case, I agree with you.  Let's remove the stubs in next version.  I
would use __maybe_unused for some of them.
