Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D5C1E0DCB
	for <chrome-platform@lists.linux.dev>; Fri, 12 Sep 2025 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757688312; cv=none; b=G9RDPGFGXny0BVScOCGrxwAcsr0lmeGy0S0mQjB1eD9UKkomPlRWiOuC4lGVHYRrJCo9dVGTOk/3k2cuHs9kLDAO8mSs0gkp2pMsHRppBbTWee5yGNpn31CSVJUCi5sbFlz/VPSyG13qCflqqN7kjWfzCov+mqXeopfVm+HhMPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757688312; c=relaxed/simple;
	bh=U9KiIoN2wWAUp8EUJ+l29eyCQ1L8N80vpZij7DtvWUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RGb+wP6UMOd0gH6PooMdtdPhF2YUHxdZhlnBW9iiJEZOByTFrvoR25s2DEduIkx40QEtx96AlDKa7K8f0xumVsy6QAxTna0HxoWBH8LsUYvCUdmtLVYtEJrgYjKAnirweE2+1fU+oZpcrfJmNXckywytKlIOunigpFLcDw50ad4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g8M6brcx; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g8M6brcx"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-560888dc903so2314473e87.2
        for <chrome-platform@lists.linux.dev>; Fri, 12 Sep 2025 07:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757688309; x=1758293109; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qn+YPoQmxEr23a5PjO3DGoBuuC3lsckh2uIz0y1OKGI=;
        b=g8M6brcxFCQ8kPtzs92sLthgi38W06hf1lJSalVmyEiiDCI/V+Y2Oso1CFh0qJd49W
         /WvRoaacJoUDvDjVXgT/wrNdePFsCjRofjOPr6Ywk+mcc1cKKbTjW+WQo1cuEypzNtFm
         1hD+1FvA51C2ZgWl7D/EQR27jvnsYreyV0z6DSkQYruitxwWgYJHr2zNTHcoZ+HpOsCR
         cqL/h+GF8+CdhqTkxviqM5knDmMiHbrmT/7dSEyaQjOrAEJkSVAlMEIou+uLEH4owbhi
         InBZYGt4fBdTwd8Zzy1AaPS3lxnicY3BkZMrGX8XdPat0TBBE0qdq1Aj2FMpJd5Pjixu
         Hiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688309; x=1758293109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qn+YPoQmxEr23a5PjO3DGoBuuC3lsckh2uIz0y1OKGI=;
        b=f4do5nx7Sj3WRD0YYpMqeu83sTUrie3wa3pqkiPYzRw3i5037Q9cTMYeQ1FhT7sOMc
         J+SvBy4k7Q/lWivqiWOK5xsjAOve9ZJaHrtrK4Lm/AZpGcS28jJfk/9mmccVgffpqzhx
         bXjNkOz3NkU4vYvWDxuvN2bavGGZEcqXw4936/kYHyfGkxZnBSfD4aX9i6EfEBo5MQRz
         Llytj1l9K52kPB5x8bUhaQ5wXL9mh6OdhGcNWcY6VXzqzqjesy7TmbrW7V5HT/k8EhJo
         sR/cJXZ4ars7aORjQV24eG8QSGw6r/hWFNazds5Lw85WlYqbhsGvtX3ug2HtSpqHKsGb
         ZRYA==
X-Forwarded-Encrypted: i=1; AJvYcCVvY6ER9IfcM+yrYSb6aiFtsFB6l+qwbM20vgvKQgtCi9j6MsUtoyXKh3EX/qx5bplmGtMdWNaYwYJUzBjozX4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTG6AYs30Z2yQq+9tLL/1MivysBv+HVlQ5G/+nkl2p0nKJuqrW
	dxYk/Irnb2uLE4aILD2lKXgGPePylJWbUBTf/AXLpIgXkXKSEKsOTScL+WdZzZe4AWZpolPuPF4
	Uxg3tMuFaMNG3W99U7egIG0p2qCA+xFXwlNL4MyzMog==
X-Gm-Gg: ASbGncs6RdsH1vGsgRrVAvudT4DpBiEJRsJzvGic0klsGUSO7RtWJFPkCBizyl14l3z
	6+QD4apxivdh5/JhrMgiSgR15crUn9fzg3HH+iqps1fe7oNKLyfCprPGfaHprT24dhYgFr7G3yd
	+EsIkEoVwqv2AclIrGXQ5nuxBZowdE5vuSBG5MRA8MddsVonuI/HsVvsfgvPtGLZCoGoHnr6Vrk
	tHPP9E1TjrhNOEkvY39byXLDDD6oAbeWDgnzg==
X-Google-Smtp-Source: AGHT+IGUzZFzSTkpABUHzFqSh86WYUDg9sPFuBwIrqL8MagbdIf4wFQyUDXaF+czSRNCauv6Lx/3Dva/JflQfhQYWUo=
X-Received: by 2002:a05:6512:1286:b0:55b:8273:5190 with SMTP id
 2adb3069b0e04-57049e24115mr1136950e87.18.1757688308574; Fri, 12 Sep 2025
 07:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250912081718.3827390-1-tzungbi@kernel.org> <2033c6cd-4112-4c8a-a9ef-2ab34f3504b8@kernel.org>
 <CACMJSeuKH+WKOXLNU92dMssqhK02xG3z=cT0VeXYM+ZGuPCB9g@mail.gmail.com>
 <aMQW2jUFlx7Iu9U5@tzungbi-laptop> <20250912132656.GC31682@pendragon.ideasonboard.com>
 <2025091209-curfew-safari-f6e0@gregkh> <CAMRc=MfdoB50o=3Q2p94o+f7S2Bzr=TAtWWQcDrC5Wf3Q5nqAA@mail.gmail.com>
 <20250912135916.GF31682@pendragon.ideasonboard.com> <2025091220-private-verse-d979@gregkh>
 <20250912142646.GI31682@pendragon.ideasonboard.com> <2025091237-cortex-carnage-5c34@gregkh>
In-Reply-To: <2025091237-cortex-carnage-5c34@gregkh>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Sep 2025 16:44:56 +0200
X-Gm-Features: Ac12FXwmroMltqxSRZA5meL-lv7f9pG4WBQaN79qLPeFe99REm_I5nZVDR76A38
Message-ID: <CAMRc=Mf76m51VKktGc2K1uT4eacDqhsroRxG2RgtRyhQrhx0WA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] platform/chrome: Fix a possible UAF via revocable
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Benson Leung <bleung@chromium.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Dawid Niedzwiecki <dawidn@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 4:40=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Dan's proposal here is a good start, but the "sleep in cdev_del() until
> the device drains all existing opens" is going to not really work well
> for what we want.
>
> So sure, make a new cdev api to use this, that's fine, then we will have
> what, 5 different ways to use a cdev?  :)
>
> Seriously, that would be good, then we can work to convert things over,
> but I think overall it will look much the same as what patch 5/5 does
> here.  But details matter, I don't really known for sure...
>
> Either way, I think this patch series stands on its own, it doesn't
> require cdev to implement it, drivers can use it to wrap a cdev if they
> want to.  We have other structures that want to do this type of thing
> today as is proof with the rust implementation for the devm api.
>

Yeah, I'm not against this going upstream. If more development is
needed for this to be usable in other parts of the kernel, that can be
done gradually. Literally no subsystem ever was perfect on day 1.

Tzung-Bi: I'm not sure if you did submit anything but I'd love to see
this discussed during Linux Plumbers in Tokyo, it's the perfect fit
for the kernel summit.

Bartosz
