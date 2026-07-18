Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063F7083C
	for <chrome-platform@lists.linux.dev>; Sat, 18 Jul 2026 00:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784335166; cv=pass; b=kyN22O38amCVAfee2osckpd1UzBZVH/m4OltGjRf8YNVUTlHxeosGMZnphVg5EzwIoQmvvokjGuqDPPHee5MMzkU783ddIGKUt0OZT0cDj34tHLY+FDNzBaNo/ye8z8pR20O83wuEHKuFYFZg8+5l857IAORIYhBBVik1SXBL0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784335166; c=relaxed/simple;
	bh=s0kPzawXk5e6VvEO2jn1aV6HFzfVmnba4zjlWLdVKD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USojWzZkx2ip56k5n47cLclCxhjk/fl43k3jiHXgWgGlxhOOu2mUwbjRTVFmInlLVSFj3FTaCp4b+j8FvcTLXfKquHsD2IuXR+6SBugCalwGIXccRMaOKa4qwXx3ngUk48jmjlS9VzOVZQFTm3kY9S4C9n0/eFBpK6hpUSIs0kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bjf4+cKZ; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bjf4+cKZ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954d5d814fso46575e9.0
        for <chrome-platform@lists.linux.dev>; Fri, 17 Jul 2026 17:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784335163; cv=none;
        d=google.com; s=arc-20260327;
        b=c/qq8NEhYECvi9WFCYP2fs4IwTyUzlYwbBCc9DFfenbxa3DVQwWreQLUIhvw9IwVu6
         UngX0AUZAzxpTMr9uJnBH8espUNgwYKrboZgqYL2CHVa064B4uj44CKOo/Odn8Jbn57p
         UoyACZtnIqCB/429uvIkbDNvxXVtwZNsPqaPva7RUdyytzYrZTKrn8nnttKADPNZDRdE
         szESwO56z43b+yT6wqQkM8CtpkLsDDEDwhxfK2WIX4WFqM8bx3g+pBEE3x5UyFxAbRUh
         e9S8FA1uftFr3bRKng0TmC2Dqqoh67qKSQU0FrscilAnz13VwX3zouO4QwzB3KM9QKVq
         09zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SLRkO0fZ0r29yomSE14773/SRoCXg/5c79uPcxE3Zr4=;
        fh=r7ri4Thdk4LM9mcXOOOTgYEE109jFjWyBcF7mc8eBHE=;
        b=r0QAPVuRinqql8FSXgKXertCEihavFHv8OKLe/90wPe63yZQmH3Ccmod5yJ1WMBQ2k
         NJSBdiqJE9ANVaNizTUHk5XCqa3hmagQ5BjntkQQVyucTejUC5hlPedobTkSRAwjjbb8
         lO7db0gAeiR4KGvvglyr67TXlR8xYlQgu5eGiyVAERJbfeCsdxwurG2QsgMYCCPFoLU6
         AVVDjhXpJ/vxz2OwSA/JfrTyLfs1X5HYVX7tCALL8OUvMad10GG0pbAaAoeqi1MIUM1I
         eWZx1KEwdfONno3GKzs9fEMLyeA/I8B73NDshLF7mGY0RbfS8wqxhIF7JMOWoNNXwB6f
         OXRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784335163; x=1784939963; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLRkO0fZ0r29yomSE14773/SRoCXg/5c79uPcxE3Zr4=;
        b=bjf4+cKZvmV054DyBuTaFBHh+fmFg2K286BGJHPfvavAw0sM5WV//2rex5NG7tNXno
         hRaAP6dg3fqDAKCjPxGryBOlVnnjSi3wY+akiVe6Axl+5ruaPZt0Cqb5Ze+Zu7OcUONb
         g+nMxjVePcVcOJLObF5y14WfVK1z0/4cxspR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784335163; x=1784939963;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SLRkO0fZ0r29yomSE14773/SRoCXg/5c79uPcxE3Zr4=;
        b=OUGESK5TBqah/MKsR7M3VJesUsu+aU4hasQbwxj5eOzY9WqTyCVQA31kufzWt8B+To
         PpWMLVzAZXsVc7q5UjZhv9z/NnDmwp7wCJ7xikyBQV6Ap1XUyyicyUg9LaST+bKLKbX9
         lFM4ESyfq7uGb7GTyi30RqPuxekYwSXwNFMd2mFrKnb4Lfszteh++fmfJ+a173hnpExa
         xKTn/jvaL1imNZubLgTJ68g73jxx2tIa8NEsMPpzYSX6JpjyMNTl4BWO15myq5/tb26i
         j8YuppmVlgFBbi73yuUbW8wCm3LcZcBXOS/sfWjdqQU2Vhv931LrIFC+OkD9i+VTglhd
         h7Cg==
X-Forwarded-Encrypted: i=1; AHgh+RqnZ/Up/bcGqW9cbB+EWJB78saiwBR3ZRHtkIV9tQ4d1TCB3qFm6vmaVt78QJjic6xM/OnyKO0R16yiE7zMycs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjveSfi7YhmCeOTEefdTroCIqWdu758byjDuYL8zgnKV0P2/n9
	i4iA6csLtJYr4VlaYp72Z6fgE8Ec+Kqtd6Z6HZ1EBMvUGhkvPxL5JU0OT+bkRMNjICvr0uHdR5Q
	aKqnSxQuIdye3W5cbOZdtx6KaO+JARK84oFnTzojH
X-Gm-Gg: AfdE7cleUU46Nn81qHV3AjDF8sc8h1S3648Nfypd2AVkQVEx5GAx+QNFte4O1gN0b9k
	Am8aCjsjDLlIT62UALqIC36qFydLlsbFMUhF/wp79IDjMaFVwbTopm7NUblhj91f2c3LtLpFOCs
	gtiZ44UKzRmYGwXNWuNH72KdeJTRV8iPEwtDZVOmVKY1dDYkLge9KMb1OtV39aiia3jSDSGmNYn
	ePaIOgYbGQpEM0NBfciQSSP/bDy4XyyQm+txsqcZD8FD128HRCaRePl6SQ=
X-Received: by 2002:a05:600c:4995:b0:493:a96b:f9fe with SMTP id
 5b1f17b1804b1-4954ff99257mr447445e9.4.1784335162370; Fri, 17 Jul 2026
 17:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717085003.369496-1-sean@starlabs.systems> <20260717085003.369496-3-sean@starlabs.systems>
In-Reply-To: <20260717085003.369496-3-sean@starlabs.systems>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 17 Jul 2026 17:39:10 -0700
X-Gm-Features: AUfX_mzIDJqwj1GCrBaRE5IDRgnHx6t1V0tiy--ulOY3EGbsJtc8_36xavsFsik
Message-ID: <CAODwPW-UZsLQhYtx3_afkNb8jtta4TO0YxhuS1a4mHomOF6fJw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] firmware: Rename google firmware directory to coreboot
To: Sean Rhodes <sean@starlabs.systems>
Cc: tzungbi@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
	prasanth.ksr@dell.com, jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, 
	derekjohn.clark@gmail.com, josh@joshuagrisham.com, briannorris@chromium.org, 
	jwerner@chromium.org, tzimmermann@suse.de, javierm@redhat.com, 
	kees@kernel.org, u.kleine-koenig@baylibre.com, mst@redhat.com, 
	chenhuacai@kernel.org, wenst@chromium.org, florian.fainelli@broadcom.com, 
	titouan.ameline@gmail.com, oliver@liuxiaozhen.dev, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Dell.Client.Kernel@dell.com, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Keep the existing CONFIG_GOOGLE_* symbols to avoid user configuration
> churn in this mechanical move.

Is this standard kernel development practice? It seems a bit weird to
me to leave the config symbols mismatching the directory structure and
actual meaning of the setting. How long would we leave them mismatched
like this, forever?

If you want to prevent user config churn, an alternative option would
be to provide the old symbol names as transitional options, like this:

menuconfig COREBOOT_FIRMWARE
  bool "coreboot firmware drivers"
  default n
  ...

if COREBOOT_FIRMWARE

config COREBOOT_CBMEM
  ...

...

endif #COREBOOT_FIRMWARE

# Deprecated symbol names, do not use

menuconfig GOOGLE_FIRMWARE
  bool
  transitional
  select COREBOOT_FIRMWARE

config GOOGLE_CBMEM
  bool
  transitional
  select COREBOOT_CBMEM

...
