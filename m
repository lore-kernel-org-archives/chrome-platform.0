Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810185;
	b=ZE6Mf0LSdHlGFCcaBRpTV7EkjAma/y9sSTCGb5RLkaSQXR2Tb29OSsEs9nhhsMs4Jroy
	 YXjYv54sM2lm9VFBqPnFehe2ttM5ROhFrNfgyzLlXDIFsPqxKTIUH5rMZHhIU+MHmx1iQ
	 HbIBPnV+P526jCKzvcYHLQroX6lHdcxM9oKEQvdKArjXdS+q/m3jXMcaxziDClszirhll
	 wML0v3t7sBu0nX7O1UE69Td77eXN97cRzH0+L55v9dGhlRa7I94JI403/2gZD8JtzzDRR
	 YOsyifxUCYckE4/zomxBiYo5PPsl3ddefkMOXFWmcWlHP7O1OwncXpX3P8VX9U+xP6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ScErVZT+Xx01FZnmYTHArJdgOAIBBCEFBjP/K3VWH8g=;
	b=X+qDdIMyL4Ql7tRawskmjECHzbycHa0aFJfpH7xOY+s/cA6LNVExw77U87u2UokL1tFp
	 1tjjKzgr7EhcfhSKRbUOzECVR0vYhACVh8+M+i9mDOyuMfBvrzY6pWJQkHmXZtPe1+0Sh
	 fU3a6AD8x6fNp9utMoMajtT1FVkiP8QEKI3oC1DXGUKjMAyp8LUchr5XDi7SdphcD7mUf
	 9/AUhM9+3ZCTgvtwhKvSp/F9j7fZSISFkiulDG+P3fg7NwSSzhGnb8t6/khCPxePZulDo
	 1DepqY9C8eTu9LpIv6MuSqgnPRUp9mKqYcCtNV2P3v8V8q665GFT1t/ytAVxYSBQ3Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GVF802KN;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DB0606A334
	for <chrome-platform@lists.linux.dev>; Mon, 16 Nov 2026 06:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0DB0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GVF802KN
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso3012081b3a.1
        for <chrome-platform@lists.linux.dev>; Sun, 15 Nov 2026 22:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794810184; x=1795414984; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ScErVZT+Xx01FZnmYTHArJdgOAIBBCEFBjP/K3VWH8g=;
        b=GVF802KNpT1Vo0dHapV9uMJQHiCDtOK+GO7xx9jHNSFTEMMO3xNUjMRHuxhSkrtj43
         lBLLpdGi6tZ2IPcWUFcxyCocpjKWxv6IEBqQkpt8Oq1Y7vA8qrS/yt9YfU5SBN3fuU8a
         R+x6ncChIGdcT9smHr95vcV8dDQTLjrhcgENx7yWEmM5lYOBw7GofPwK0KXRFAvHAilk
         I892nbbElMuxt8SmuTId+ioy8GMMiwjwpA/MsNLYfReKIh+knzqf8XJ+a7QN8hP6q7hk
         lKl2F5ptsQCJ207jKjcuZ/VjtgOJJAIQySsNsb0YOjIVpnhlo/c77Li0HE6ByV0mnGkc
         iCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810184; x=1795414984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScErVZT+Xx01FZnmYTHArJdgOAIBBCEFBjP/K3VWH8g=;
        b=rKV26I5D5ePXsp3LShtGqD0q5aUAL24GFc9+ejJTjA0HweQyShzAb2kzeOJ4eEtjIv
         nIhEcpkqXboMlW44/g/9/UwSx9hAPL+qe6lyeiilBsp27QUe6vLtGITGPwvR+9nWKHDc
         Oq7FwG/LqRNe6O3cI7cwG+ETNX84ClTCrGFQZ42u4gZzTf/vb8hOogNbyizTo9CbnPUO
         jUg+Qjp7tYegXYlsSFO4J/eQNkPh8rZuJfa2YxFnhGveRfdycBgafBpW/ALkp6oetQyM
         NHdlHmx5uY7HioHBhAWMMEkW2n66C0l2GazTymdsgUYdg5W0VyuWBjKVuVxUpAUTr/w0
         jsCg==
X-Gm-Message-State: APuU4Z+V5VIyYHQn31iYj09M45mgWa3yOJiYumkOfMIL1pM+DoHov9KX
	z5fDU0N2YE/RpkWbh1CoP8D0CPlneCsW1j0VV6Ge5dgvMZekhvoIdUBl+K0/bC/Vdw==
X-Gm-Gg: AYBFou0hjMzKMmF/j7cBD2fNdGEv1tYIf3J1JcibyfwULYzwnFyoC7G54TzH8dUY7Mi
	rPMBUgS1VzXemRrN4QMxBzRFihscs8ZmmRxBpaGUxQt/HkdRcj6qdGCXGVHmUFu2EPVeMKTEew6
	tQve/BOH7tjmat9PPsWmRH6AJ+50UMzJDu23Ge2RglW9OKzatPZajLnBB3swYDD7q4FmsKaF8J5
	kziwMYZ117zIY6ZTE+C280Mfu5N7Qwu/aZXCqgVyIRWqlqts0evoZzOLFK9PesywvCStTdkaT+q
	oR7RzcnJbXuwwaq2Hh3f/E0oPhwWiEuyIm5abzL6kDL6n0Bb1MG0EJeNsVw352aSVF6jRgUV03Z
	p7FTG1V6LoqR6LtjpaC/oAHeWLQE+fIWyDyC8lf1GbfWo2JBcqRA8XFlQ7YQ1mwNqNrp7xrfFsH
	gTwhZLx9D4yhJbWo1upKput6sZXYxzmalQlG3pLlvRGPP0Tx0DHkiMkvaRzFowUgR6x7oH+PWDM
	nPIA1R/EF2xrTk5d47HTDNgwo03K7F+R4jgPhpK0gftnVwn17/lxI/G8CBiLZOoCTynlWRfPPCK
	U6/yWpB6Eo6CSEFyQaRQNnwNdg5zRCkSHyAIT5ZR8uY9zLOOScS7DTjPm94mfiT6dzn/soFbkYR
	Tc7NgkG1efwmi4L5/ve6Qs1fXWahQOl+guKslJAgM64w2z4SIrpNJ+EKgeDQxOdAYopbgykGPux
	9II/SpRWFIXoRy
X-Received: by 2002:a05:6a00:2c95:b0:878:34d7:697b with SMTP id d2e1a72fcca58-8beb7d1cca2mr8732092b3a.41.1794810183230;
        Sun, 15 Nov 2026 22:23:03 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcce76sm3180249b3a.5.2026.11.15.22.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:23:01 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Sun, 15 Nov 2026 22:22:59 -0800
From: Benson Leung <bleung@chromium.org>
To: beardedtechwizard <beardedtechwizard@protonmail.com>
Cc: chrome-platform@lists.linux.dev, bleung@chromium.org,
	akuchynski@chromium.org
Subject: Re: [PATCH] mfd: cros_ec: Don't abort probe on -EOPNOTSUPP from
 GET_FEATURES
Message-ID: <CANLzEkuaUmOopbO5eGQaC-jXX_wMZ5hEocCQ6PJ6DYpjFOWXtg@mail.gmail.com>
References: <hQEGbKxcpoe707VrIrPkgUiFwcIdxHKUXSAwVg0k5ppyHFPa9RrZXrwkKIdgji2EqMc_0LARMGKJhh1Co9TAHhlflydCWQxkYRaFB7u3bc8=@protonmail.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hQEGbKxcpoe707VrIrPkgUiFwcIdxHKUXSAwVg0k5ppyHFPa9RrZXrwkKIdgji2EqMc_0LARMGKJhh1Co9TAHhlflydCWQxkYRaFB7u3bc8=@protonmail.com>

Hi,

Thanks for the report and tracking down this regression. A few comments
below so you can format and resend this properly as [PATCH v2]:

On Wed, Nov 11, 2026 at 02:02:09PM +0000, beardedtechwizard wrote:
> The patch that made cros_ec_read_features() a hard failure during
> ec_device_probe() breaks older ECs that don't implement
> EC_CMD_GET_FEATURES. The error -95 (-EOPNOTSUPP) is not a transfer
> failure; it means the EC predates the command.
> 

You need to reference the commit that caused the regression in your message.

Based on the context you provided, I dug it up for you:
5855464dff6a mfd: cros_ec: Read EC features during probe to catch transfer error

For ease of review next time, include a
"Fixes:" tag.
Instructions on how to format a "Fixes:" tag is here:
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Yours should look like this:
Fixes: 5855464dff6a ("mfd: cros_ec: Read EC features during probe to catch transfer error")

Since this is a fixup patch, it's a must to send this to the author of the
original commit, in this case, Andrei Kuchynski <akuchynski@chromium.org>.

In fact, you've sent this email only to the chrome-platform@lists.linux.dev.
Run 'scripts/get_maintainer.pl' on the patch file you created for this fix.
This is the list of people and lists you should send the patch to:
Lee Jones <lee@kernel.org> (maintainer:MULTIFUNCTION DEVICES (MFD))
Benson Leung <bleung@chromium.org> (maintainer:CHROMEOS EC SUBDRIVERS)
Guenter Roeck <groeck@chromium.org> (reviewer:CHROMEOS EC SUBDRIVERS)
mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD))
chrome-platform@lists.linux.dev (open list:CHROMEOS EC SUBDRIVERS)
linux-kernel@vger.kernel.org (open list)

> Before the patch, the code handled this gracefully:
> 
>     if (ret < 0) {
>         dev_warn(ec->dev, "cannot get EC features: %d\n", ret);
>         memset(features, 0, sizeof(*features));
>     }
> 
> The new code replaces this with a hard goto failed, which aborts the
> entire MFD probe. Result: no cros_ec_chardev, no /dev/cros_ec, no
> cros_ec_sysfs, no cros_ec_hwmon. All userspace EC tooling (ectool,
> fw-ectool, cros-usbpd) breaks.
> 
> Reproduced on:
>   Kernel: 7.3.3-100.fc43.x86_64 (Fedora 43)
>   dmesg:
>     cros_ec_lpcs GOOG0004:00: Chrome EC device registered
>     cros-ec-dev cros-ec-dev.2.auto: cannot get EC features: -95
>     cros-ec-dev cros-ec-dev.2.auto: probe with driver cros-ec-dev
>       failed with error -95

Please also provide the make/model of the hardware (which laptop, Chromebook,
etc) where you reproduced this problem in your commit message.

Your patch email is also missing a "Signed-off-by:" tag, which is required for
all kernel patches, and the Developer's Certificate of Origin requires using
your real name (known identity, not a handle/pseudonym) in both the
"From:" header and "Signed-off-by:":
https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Please fix that with git config --global user.name "Your Name"
Then to get "Signed-off-by:", just use "git commit -s".

You found this in 7.3.3 stable, so make sure to 
Cc: stable@vger.kernel.org

before your SOB as well.

> 
> The fix is to treat -EOPNOTSUPP as "no features, continue" and only
> abort on actual transfer errors:
> 
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -207,7 +207,7 @@ static int ec_device_probe(struct platform_device *pdev)
>  	retval = cros_ec_read_features(ec);
> -	if (retval < 0)
> +	if (retval < 0 && retval != -EOPNOTSUPP)
>  		goto failed;
> 
> This preserves the original intent of the patch (abort on dead EC /
> transfer failure) while retaining the compat shim for older ECs.
> 
> Tested: with this patch, cros_ec_dev probes successfully on an EC that
> returns -EOPNOTSUPP for GET_FEATURES. All MFD subdevices register,
> /dev/cros_ec appears, and ectool --interface=dev works.

The code change itself makes sense, since EC_RES_INVALID_COMMAND maps to
-EOPNOTSUPP while actual transport failures return other error codes,
and cros_ec_read_features() already zeroes ec->features on error.

However, we can't apply this email as-is because it doesn't appear to be
generated from an actual git commit: it is missing the "---" separator and
git diff headers, has commentary placed after the diff, and has a broken
hunk header ("@@ -207,7 +207,7 @@" for a 3-line hunk), so "git am"
doesn't apply.

For v2, please:
1. Commit the change in a local checkout of an upstream kernel git tree
   ("git commit -s"), after you've configured git with your real name.
2. Generate the patch with "git format-patch -v2 -1".
3. Run "./scripts/get_maintainer.pl" on the generated patch and include
   all listed maintainers and lists in To/Cc.
4. Send the patch using "git send-email".

Please follow the full patch submission guide:
https://docs.kernel.org/process/submitting-patches.html

Thanks,
Benson
