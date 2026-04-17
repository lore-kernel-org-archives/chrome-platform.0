Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E8A1514F8
	for <chrome-platform@lists.linux.dev>; Fri, 17 Apr 2026 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776461161; cv=none; b=pRojTfWVDI234l8vlbqiOJzAR69gi91MPuC2JbZ86JDUxrrsBtQSGSqbRIG+GbT9QT71GQHuzb0iO+ZFOxCBGgH9YY+4xbBPWT7S8/cBLbCod5VDkAoe5l108bJtNtTXAA+zBTRVLY6U7Rcmt4Z4ZZyvL7XnILkz4kWP0CqvMKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776461161; c=relaxed/simple;
	bh=cM9udh9m47+Gpj0oDvbKWKK6KeOdsP7t3oTK77nW7+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxigU+9T9T5dK6L1TLu7nRMyu3emXa5o3xksKg8KCTnilZRpnuI0eUEvlZi3/BmseZVd0AOr9QKZ1Nw3tEMw6WBDM8KtgcV5+UOzcLpS/GOHVti7FUjatHX3bsoTLszQr2Br071H/Y5Q6SExnZXDVZ5hOc9b2CQSkGt9AXXEiOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YPXkyZE/; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YPXkyZE/"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c565dd3a7so2007613c88.1
        for <chrome-platform@lists.linux.dev>; Fri, 17 Apr 2026 14:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776461159; x=1777065959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ErnZs3Q6bv+thvgwVa4Ah5gWyVYiLGdPrGb5UASYA1s=;
        b=YPXkyZE/QDcZx7FjzmTmiuHclCcLFU0QLtvfvBevN81s+AL9CHwTL+LhrvswxduYqn
         1pm1dIRPZNNviKo4/C+rykxehykXdXwtjucRijq5qDPyRHCdhebRDWAKgi9KxYrwExGP
         F48ZxwTpRePoMXYNA23rJLfLdwWQ0aEGtNOFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776461159; x=1777065959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErnZs3Q6bv+thvgwVa4Ah5gWyVYiLGdPrGb5UASYA1s=;
        b=jdM2kml3r0IKZRv2i3t50BIKeh0pugRm+Jw58WbJNVi+KoEGPef+X1yPWlJLZPYjn4
         02kqGrk52SjNW5+vei9PYoufnKFQR21Pc29Sm+TB9+QBe1FlBaPZZkXxzWrMdotJoGwV
         Z5GDjqoeCPAe9lRhnVjQX5BBtRnym78vV02JbuvKGy868snr9M3SYIPGNByNghdwaY8W
         P0UvwtomtsNNFRupMRkJTG98tkYEEYyht/2O2hRiHX3pv2Dv9UxO2lJSEVaZZQzA9VDQ
         J9zBmo/ZecCfzt+t1r3GEAbhOtRarhS3TX0l4yTETx+2CaATLTjE6HwPMUAKF5AoaGcF
         ZyNw==
X-Forwarded-Encrypted: i=1; AFNElJ+vYnbdm3Jwn4HROJPtz9TJ2CUPK/z7UayOacyGcZqJqNduvGqEUzJBw6sxf+LQgbp1qlIDvEJefbD78CWX+oo=@lists.linux.dev
X-Gm-Message-State: AOJu0YygK7wISakTCc3nkD+Rjng7ur6KwV+kvKZoDtS2vZJZsTdyQfDZ
	D54gMqF+dx/CzT0u/vzGT+QrAYBvbGXfUxRwYlkTe0/H74npKoag6f8VZBw6ScSUVQ==
X-Gm-Gg: AeBDievxSLegByM8PWiLi4xj57fPCqHnNmELXkn0gOwN2OhNZqmFgsxCjPeOUGz6MQj
	MiljE0XSNTM7hlpTR3tUGh6p1eVdF++sFGlpVrWIFgHuyJckZfQHujB9Wl8UEYmrq68uFILHBVh
	f522FJqS6hJO8TUac/gueYUohwLM+95QeKoF4YabBWj/wX7GxxK3p1JZTec2NI//toO22/r8CgN
	v4FpspEPdgLQPZYm7v9Xa1suUkmrvBuYEdAo1d3aGL3JgbdIur8W58QL+/DK9zWIZE0ORB1XMnn
	/NGNINEhtDFmfAy5KxNCEEcx/x4nVlcnULxeCoLsDTL1rUxyDiq34Kq5cqTR6OlkXHr4plSpPjc
	rcmgC7+wyXq2rfYF94il3GtUpAi4+qpsqbCdx6g2dwOUBVHwA90a/WgxobRXDHVkPCrvzuzhNeu
	m1it19XcxuSEOTU6GmUZ/lBKq2aTmHDYa5FbFaxn9incCRLW1HvomwX7cFMrEf7G6peBwn5pk=
X-Received: by 2002:a05:7022:383:b0:128:cf86:d1e8 with SMTP id a92af1059eb24-12c73fa708emr2682205c88.29.1776461158761;
        Fri, 17 Apr 2026 14:25:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:a468:d4b1:9c3:f6c7])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12c74a185a8sm3892511c88.9.2026.04.17.14.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 14:25:57 -0700 (PDT)
Date: Fri, 17 Apr 2026 14:25:55 -0700
From: Brian Norris <briannorris@chromium.org>
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Doug Anderson <dianders@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: [regression] of: mis-parsing Depthcharge's /firmware
Message-ID: <aeKlYzTiL0OB1y3g@google.com>
References: <Z0NUdoG17EwuCigT@sashalap>
 <c25e6a80-f6dc-4ef9-a90d-0fa09cbbc217@linaro.org>
 <Z0NbeyTwxo-M4Lgi@sashalap>
 <936bf452-3d1f-4940-9a91-69efcdc6985e@collabora.com>
 <CAGXv+5FLkZbZVHNkfRWuT+OioZ0TG=u2WfaFCx-jZFi73QHnVg@mail.gmail.com>
 <19ba4910-f909-41b4-ba62-c904bc37d41d@linaro.org>
 <e77669ea-9edd-4321-8d17-4da40161b59d@linaro.org>
 <Z0R6myuCR4Jpmc_y@sashalap>
 <CAL_Jsq+QBweDZ+1=FXq7Hez=+mhiOxOvurr3rP0+3y_FCd49Ew@mail.gmail.com>
 <20241209092809.GA3246424@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209092809.GA3246424@google.com>

Hi all,

(New subject; was "Re: [GIT PULL] Devicetree updates for v6.13")

On Mon, Dec 09, 2024 at 05:28:09PM +0800, Chen-Yu Tsai wrote:
> steelix.dtb is the same, plus the firmware now inserts #address-cells
> and #size-cells under /firmware. This fix has landed for all future
> ChromeOS devices via our main firmware branch [1].
> 
> AFAIK they also have a bad FDT END symbol. This was only recently
> discovered and fixed for future devices [2].
> 
> 
> ChenYu
> 
> [1] Gerrit: https://crrev.com/c/6051580
> [2] Gerrit: https://review.coreboot.org/c/coreboot/+/85462

This all comes back to bite us, since nobody went back to patch the
existing Chromebook device trees, and now we've added a true regression
on top:

In commit 6e5773d52f4a ("of/address: Fix WARN when attempting
translating non-translatable addresses") we now reject devices without
'#address-cells', and this breaks the DTs generated by bootloaders
without Chen-Yu's https://crrev.com/c/6051580 fix (this is ... pretty
much all Chromebooks). Specifically, Linux now refuses to add 'reg'
resources to the /firmware/coreboot device, and we fail with:

[   11.886271] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

This is almost certainly a DTB ABI regression.

This was noticed here (OpenWrt supports some Chromium-based WiFi routers
that use Depthcharge-based bootloaders from many years ago):

https://github.com/openwrt/openwrt/issues/21243

For now, I just patched up the OpenWrt DTS files like so:
https://github.com/openwrt/openwrt/pull/22951

But what should we do going forward? I note that Rob says "We may
revisit this later and address with a fixup to the DT itself" in commit
8600058ba28a ("of: Add coreboot firmware to excluded default cells
list").

That never happened, and a ton of Chromium devices are still broken.
(They don't have WARNINGs, but /sys/firmware/vpd, etc., is still
missing.)

Can we patch of_bus_default_match() to accept an empty 'ranges' [1]? Or
should I go patch every Chromium-device DTS file I can find? So far, I
think I can get that done in 17 files in the upstream tree...

Brian

[1] From ePAPR:

  "If the [ranges] property is defined with an <empty> value, it
  specifies that the parent and child address 28 space is identical, and
  no address translation is required."

And:

  "An ePAPR-compliant boot program shall supply #address-cells and
  #size-cells on all nodes 16 that have children.

  If missing, a client program should assume a default value of 2 for
  #address-cells, and a value of 1 for #size-cells."

So far, this does the trick, but I didn't review all the ramifications
here.

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 4034d798c55a..f86386c407d4 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -328,7 +328,15 @@ static int of_bus_default_flags_match(struct device_node *np)
 
 static int of_bus_default_match(struct device_node *np)
 {
-	return of_property_present(np, "#address-cells");
+	int len;
+
+	if (of_property_present(np, "#address-cells"))
+		return true;
+
+	if (of_find_property(np, "ranges", &len) && len == 0)
+		return true;
+
+	return false;
 }
 
 /*
