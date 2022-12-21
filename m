Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3B01FD2
	for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 09:21:01 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3e45d25de97so203384517b3.6
        for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 01:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GdBHixmIEv6hOlchC/qp1j/sG6Htlu0RfoDp0oBFpT4=;
        b=D3X8mRE2crBgGEVyUX3K4KS+R2JbIxF9wo/5kXFjDg8fbDrSy0+PqWSIC5f1T0gfJM
         YxOylDvVXQyP3YJJaa8HndLDF/D8/qvMXz4119hQqQdfy7nA0CcnCVpcq+l7WvXVxS5A
         /Gm5XhG1fJFmyOLA6NEbEohEyZ4QJPHt0fV4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdBHixmIEv6hOlchC/qp1j/sG6Htlu0RfoDp0oBFpT4=;
        b=xdHRMeyuJOlIATa5G80cUGD4ARyzWmOB9qF/PiqpxETN69GM6YJzYlocOqhxdyhHHA
         9RJ0i1OyHkCfWnAoPsp1W+EwqXjsTmpG2fDEe3D/6nju+VVCaOd0uKoeQEaLS39CQmhR
         GITY1fOZIyOeXw1p42J8Q4LDV4ZTjaEFDApWKIx/GWrSkpSuIXZjZIFGt6Nl5YmydIEm
         MeeqyJrXW42EbavHJrvquEnVgEZDMAFEVaHvrSqKTfntJU5nBdXIzNp9+CPN3eJ3JWFT
         pAwl2umMAnX7r6bGEST02FPqhB/bq133XESHsLlmomo4yS2tkT/RIgv32d4ED/GMzhWQ
         1Itg==
X-Gm-Message-State: AFqh2koc7EVSVxX3LCcKjgaWJ+/0zYg8Ve3uyCTld1oP8Km88/eI4lev
	xnMKlcLtXAhoUaZHrScQ8R0AfjQ+sBvB34Angizbig==
X-Google-Smtp-Source: AMrXdXuDZP3huzKwnSrYzcLfOsxhi9bC8TChPDvh7YCGBFcEtyx2l6GJ/kdx10BPsjZhHQk7GW4nP63qMJH1yi1taFM=
X-Received: by 2002:a0d:cc8c:0:b0:368:70a8:9791 with SMTP id
 o134-20020a0dcc8c000000b0036870a89791mr129912ywd.197.1671614459562; Wed, 21
 Dec 2022 01:20:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221220055954.11197-1-zhouruihai@huaqin.corp-partner.google.com> <20221221070122.4167-1-zhouruihai@huaqin.corp-partner.google.com>
In-Reply-To: <20221221070122.4167-1-zhouruihai@huaqin.corp-partner.google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 21 Dec 2022 01:20:47 -0800
Message-ID: <CACeCKaeVMDWNCmatKBk+V60K_Cqct1gGT+iDk6Et08dY-BCdWQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: deferred probe when typec
 count mismatch
To: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
Cc: bleung@chromium.org, groeck@chromium.org, knoxchiou@chromium.org, 
	weishunc@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 20, 2022 at 11:01 PM Ruihai Zhou
<zhouruihai@huaqin.corp-partner.google.com> wrote:
>
> >>> Is this really seen in the field ? The EC should never report a wrong
> >>> (random) number of ports. If it is not ready, there should be _some_
> >>> indication that it isn't ready. Does it really report a more or less
> >>> random number in this case ?
> >>
> >>  Yes, I saw this on corsola board. The EC report a wrong number(not random), because corsola emulates HDMI MUX over the current
> >>  type-c mux stack. The ec has to fake a type-c port to pass the MUX info. But the task are not initiated on starting up, and increase the
> >>  type-c port counts after the tasks finished. In this case, I saw the typec->num_ports = 1, but the nports = 2, which will be probe failed and
> >>  block the HDMI mux function.
> >>
> >>  I will send v2 patch, if nports > EC_USB_PD_MAX_PORTS, then return -EINVAL, but if nports > typec->num_ports, we consider wait a second
> >>  to ec task increase the type-c port counts if there're a HDMI DB attach, then return -EPROBE_DEFER
> >
> > The current code just reduces nports if it is larger than
> > EC_USB_PD_MAX_PORTS. Again, I don't see a reason to change that.
> >
> > Anyway, I am not sure if the above will work reliably. I am not sure
> > what "HDMI DB" refers to, but if it is an external connector its
> > status could change anytime. In that situation, no amount of waiting
> > would help. Either case, the EC on corsola should really not change
> > the number of ports it supports. Either it is a constant that should
> > not change, or it is dynamic and the EC would need to tell the host if
> > the number of ports changes (up or down). Trying to fix this in
> > cros_ec_typec without well defined protocol exchange with the EC is at
> > best a kludge, but not a real solution.
>
> Thank you for the reply. The "HDMI DB" refer to the daughter board
> attached to the mainboard, which don't change anytime. In fact,
> the corsola EC increase the port count dynamically with some delay
> (no see a standard yet) during bootup. There is the EC code to
> increase the port count [1]. If the cros-ec-typec get the type-c
> port counts from EC before the EC increase the port counts, then
> will probe failed if return -EINVAL. I think the cros-ec-typec
> is replying on the fragile delay in EC, cros-ec-typec module will
> not get the fake(HDMI) type-c port counts once the EC deferred
> call is later than the driver probe. That is why I make this
> change. For the verification, the driver always probe failed
> when EC reboot without the patch. But the driver probe passed with
> the patch after a few times deferred probe.

Sorry, but I agree with Guenter; I don't think this is justification to add a
hack for 1 board in this driver.

In what situation does the EC task take so long after reboot that it
occurs after a module probe (which occurs shortly after system boot up)?

Why is the "corsola" board increasing the Type-C port count dynamically
after some delay, and what is that delay amount? Why can't this be set
via CBI/DT or its equivalent on your ARM platform?

This seems like fragile code in the EC and should be fixed there. The
number of Type-C ports reported by the EC really should be invariant
across the boot lifecycle. I don't think this patch can be accepted.

Frankly, I'm concerned that doing this might be introducing some subtle
bugs in the EC Type-C code too (I'm certain there are assumptions
about port count being static there too).

If you really need to change the number of ports dynamically in the EC,
add a board specific-hook to not respond to the EC_CMD_USB_PD_PORTS
host command until you have "set" the number of ports.

Best regards,

- Prashant
