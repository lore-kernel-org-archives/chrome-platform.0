Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9681F8BC5
	for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 23:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741908556; cv=none; b=Qkrt0xh8p64iNXTqagVZL+2uroYXYwp3naU9d7v0WR0LOELBCkyWi0uDHrL/VecLb3M7u0FIznneDfc4502qgYSjqCvuHbsg7xB58V+tLYJCFc4FkSY9fYC46ZnLHSlwctoE5igsNczf4LaNSf6oXcJVWcmH+mQhcAgthSd5fGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741908556; c=relaxed/simple;
	bh=fLmgjAemiovWofaWjxUzmEbQJocXHzEtlxZq33BB5yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhUuAkyQJV69KyINboULBBe88iVV8q28NGnDzxix1Q2x8MYqXtVGs8Ke9azGvo2JEoEG7n6ibE/gePJExDzcOZZ1WczmBPE7DpBSEPdUvPGkfCogRa1ZbuYCtQmMMo/CnyGbtQ21opdxtRoQHLQcZObHUyEV+y70HCEeT+Nyogc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zHtzot47; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zHtzot47"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e56b229d60so4878589a12.0
        for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 16:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741908553; x=1742513353; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLmgjAemiovWofaWjxUzmEbQJocXHzEtlxZq33BB5yw=;
        b=zHtzot47hIPMbQPGzLkn0w/rsiAxkwMFYWxNoP1e0pc6cglUgGWB9eVG7RJfkVqZC9
         TtHGWzWWDl27Buxq/IsXimQyZ3jKWb0NboWzj/4iU8TXe5Ihiv9Ffx1HxJD+r6UHS5Y4
         uxbKr1eboyjf7ZaC10uFj+9fuCcZGytc+fShpiW1DH8uM8tv5Z21zVIVH2ps+N3ILJZV
         h6xNUsmmpNuIkxlWuHgOciXKBkQvAKaDCONuQacxpAcfnK+smlWlVyi42Uwwv30g7l2z
         vOfZBc5kyasfQh4LwhjlPyMxZggukrhaxuI+9QSenVVTQ1g9JbKWzMF+raiCbtJIR6bK
         aOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741908553; x=1742513353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLmgjAemiovWofaWjxUzmEbQJocXHzEtlxZq33BB5yw=;
        b=sPI5tt3zLeg+V2YrJGEORg9xT4EGKJypyOYC3sr4Y0ArbQl8op6C4mWKEql1cFhcdt
         YmzYuRIpHcJqGlBxFq0lWVMhio3FfcV0a9pH8Y0B0IKbkzgSLuBjefP/5HGE8qRlC2PB
         8O2B5gMw0H3zldsQkHNaSxBHh01xUpaumvNakan3zp907pBzcZP7oTwvOHuZdxosFuLF
         sG+6buOBq1/gIzZzXS/6Rf+XlD60KF+Upu7Z8IBUkZM70Ipz26mwSL5/Rhht7ThkUAlW
         auD3apWOWwVFW3lVEjc/BA+N6cqrtv9iS76IrJcTljY6ooOJY2ZpqUvkKK/hcYbBqf9h
         aPNw==
X-Forwarded-Encrypted: i=1; AJvYcCXRq2fsCheGolMJAQ63I8WojhhJj/G66bjFrRN3NR3gzyvnDXEjzbN6aAJVVTcqvWIan9oH5e/hzgRdMWC/uS8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzaBG9pyZiAneTmaAeyYP3Uk5tYLep0zpEtY+FzwFMuccgOhQ9
	evDVFTnkkMvnt/0VcvHl01cJKFB9f/LT1Y093OLrnQ/ZrK/6CxfMja9Mt3AGjI9kDwA/LlrwI6Z
	oM77xnHuzd633oUKHK1eygB6mgZFDxGNigtEQ
X-Gm-Gg: ASbGncvg0RVVqy7YiLxxy6gL/VEM/T75iNbZIv3lLH2ejl6aldW0SkfdcYLXPN+0BhS
	TG2rUgKYZN9laoe4lJtOGb7RbiN0WOnilTC09BP/pPas4mFmZRKy4X4JNeJeAx2p8KehUGpKJsd
	z8jmeQVJqVrIUyyKjYTS3xA9Cfa0v5daHjtDyP7F3mSxcQuw3rd+LHxUr6Aoj5zS2DLA==
X-Google-Smtp-Source: AGHT+IEhG6Uj2ZgXODFDQkPgzEVnFaKEkMeOMCOgSAKxsS7ffAl3Oika6RfeExnwIHlB01YBUlfrm+cZgMXZ8GfGSBI=
X-Received: by 2002:a17:907:6ea9:b0:ac0:4364:4083 with SMTP id
 a640c23a62f3a-ac330de660fmr24794366b.0.1741908552998; Thu, 13 Mar 2025
 16:29:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250312195951.1579682-4-jthies@google.com> <202503132357.RnlF5A0E-lkp@intel.com>
In-Reply-To: <202503132357.RnlF5A0E-lkp@intel.com>
From: Jameson Thies <jthies@google.com>
Date: Thu, 13 Mar 2025 16:29:01 -0700
X-Gm-Features: AQ5f1JrveV3I6ofpSQly6Maa1d3lFcNQ3Xq7VBo9SbjQm6kMIPtOwMRmVpnj6fw
Message-ID: <CAMFSARdJgVQitDWmszbhSiVfu4hCoyyNVj3LPHb+7wq64C1BiA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: kernel test robot <lkp@intel.com>
Cc: tzungbi@kernel.org, ukaszb@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org, swboyd@chromium.org, 
	akuchynski@chromium.org, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Echoing my response on patch 1/3, thank you for taking a look at this.
I=E2=80=99ll follow up with a v2 series to address your comments and resolv=
e
the build issues. Additional responses below.

> > devices will be created automatically. None of parent devices should
> > ever check if the child exist to create a child - it makes no sense.
>
> This is still valid - none of parents should be poking around to see if
> there is a child or not. The core handles it, DT handles it etc.
>

Understood, we can remove this for DT. We need to keep part of this
check for ACPI because there are platforms which need this driver and
haven't defined proper ACPI nodes in their FW to load cros_ec_ucsi.

Thanks,
Jameson
