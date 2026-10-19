Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447995;
	b=3Cltcf/gzmtCtCTyer4PHrhPosYwkQJMv3mxZJ8FPtNblaPAV0D3eNGKBZ77a9a/i/gS
	 lOqbRbvU2dV/ZdpI8GtWYlWywl/g91iv+0QMerv/JXAH3gVylTLkwMB+hkDKJn0cpeuPl
	 QOI7pYwtgao4nfcr3B5KQwVPEqhuRumk5dOVyAE8mbrXEFunJm434U+wzbknxicdFQOQx
	 7Dn//70edXpt6ZwZ70d3Ngx1K3i+Xg2xRYPesM6nrOHnsErr2nqCTpvBRx84370gxQ49K
	 A1cwXKEFSC7cCXQmDVlXq3QXlUfogIkgv/M3O1zW2NROoaOvHfJocUQZzOka/Q38y0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vgI24pfivW/KSR6p/LzKr7Y9Wp61Dy6+zsomkmDVnCk=;
	b=dBlVVHyY64v8ELgCIBTfuiicigehMaI2OCygxlcWOBjldRgCYOiG4Esu+5OqGZeBJEeh
	 HRYp7wb4cITYePMcwz3bCEqcKVTpvFpLK8UXOayd4KOB8GE63EL/HJPHDtsRR/r8xhrTh
	 2C30+5aWfix415ax9AcNTbcAJK4OVOdPTfuDsvwlgWdzdvns766bWR++2YYv/lwUdowNa
	 GllQhly8cS0ho7DBYizf7p2B/oQpyMqBOX3rLc1KG7kDnb2MLW6Wg41qeBYPvgyXrR0QB
	 igxSurlJdlT9wdDFI2f4dDZHdJoXvBqs2QCDe2UF0BnOZNC/1blgnbooF/Do/IqDGLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=n2KFQfrg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61690606A330
	for <chrome-platform@lists.linux.dev>; Mon, 19 Oct 2026 22:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61690606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=n2KFQfrg
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533202fe429so119511cf.0
        for <chrome-platform@lists.linux.dev>; Mon, 19 Oct 2026 15:13:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792447994; cv=none;
        d=google.com; s=arc-20260327;
        b=GdNKdqqzwSvjpErTzaLD3apVmQmgpce1b2ybvgEVxSFikWK6yiF5RWuJt/gdAgR6mx
         O3u41QEahxg8EPXhq9qOYT20K+zT2bjd4GGN+/PUFzkThaJQyKlQJbeWSwJXq6mxRDIZ
         KyYTXDXtG5HrnVo1bpOZw1L9imsgypsQ5kf/k/AVCcY4Hncyp3jzhlqSXT6TWp54e2VW
         pB9M323J/X2T/t3hfuNaumI1SxmDWQclCUAh1eR0CZumGE5Zx6Zg7JSkSIEENkywCV9c
         0M/w2r/uYA/hHlNz5/d2dY8iHHMb9+f4b+1kBhZBiLdz4waAd3kpnsnbuNIWtSwZknYY
         aLGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vgI24pfivW/KSR6p/LzKr7Y9Wp61Dy6+zsomkmDVnCk=;
        fh=T7Ug8G628mDcWrckBW7jbbwEJPiJZxKrniyFbPVbucU=;
        b=KPxIe8AhHtgEK5ncRVOzhzBt/PSkFSXnqpZ3tksPOt4C1wL0QXUQu3yCnRScqnf4BT
         sMGjNNMCohrnK/54g2Q8DtzL3oVInrh05aZABs5VkZKSC0jkL2qgDdEqNWddrTaxgQfU
         s4iyk8Lwbvpq5XkaWAXLcjLgc0FvAwkc/WjmO0F1mQ9MHimToBZfz/X+udUldMYuhtHY
         5BAi3FWnzTqovAo1jOfpPrbcFm5eQVtfRvhzL7iksrsT/SNsz/QnglNkKzvSGLaR4kSa
         38BNP6D2whQx4qsH15RF6Y5tCLv6HZfqzWpsFmDCC8FfNV9S54PfY02wn9RlWUZtUNFk
         ZESA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792447994; x=1793052794; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vgI24pfivW/KSR6p/LzKr7Y9Wp61Dy6+zsomkmDVnCk=;
        b=n2KFQfrg2HbtN5gUgZljBui0HmorXuGZ8fu2ntUXN70kfqtuxG6qLYHf+K7FoYFfy4
         GVHGivlZ4kkbhbGWyId2CWUG+0EGY9uqnWu7oj6XMlDz6OFMHGpTIuPz5juJ6uzQrE4c
         JkKNayDyw8SBAifbaypwYwDIfahZ4OtxwnvOyJ0iSdcjd2q9VR5gDfgYKzPizEs9piua
         GtAPrlth6kX+dXSJbA7npF83at5I5LlDH3Ys4PVY2YeBhb1LE7TYFFjJqOeFWKdSLfX0
         tcGhOVOI6sHA/aOizQdRDDNHHPdAk5S5T5Y1tWI6r2y+R5N7qUkbGKHCBqdTAAPvSZ4O
         1Fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447994; x=1793052794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgI24pfivW/KSR6p/LzKr7Y9Wp61Dy6+zsomkmDVnCk=;
        b=moAT7PCr0ekcoZmAIiSPp+pOf/Cyw8KSMM9XHaVXn+j5DtEz6Tumm6clemchEUjlIe
         NK2cQGfRYX9CcUV7tKOVmiAyyYNyajnbO2k0qwp1tNFqsOtQ9G9O6VJcYcIrRwsA8o+O
         33lA5lpg+X6Qy09kn+4k3u16z112LQp2KNJ8q6ZySSbgYxrKGJ3LbYEglCWhgA01Ff2q
         1I+uGl3uJ0frDwzXfb0jQx6QjlKLwbB2EleNgEoqW+iSfszV5GpN2jxyIxe34zOH5PBf
         2E3GwIb/XRsCiuYQenlELvCIvHu6JINNkv+gBdsDwyH8uEFd9e0fTyOFZREjN/J5uRKf
         Shdw==
X-Forwarded-Encrypted: i=1; AKwUvBxzpILVmlLkW84bnI5eHpoXqWy1T69FWWoHjfhKNiYWfEV5RWPSM7501Jzuin6rLuIPAaXOt96NiPeypymOB1Y=@lists.linux.dev
X-Gm-Message-State: AFq9FYLCPI5xgDIO56LykZOjPrnPtaf5epDSkT5JziKoVurpVbqGmBWm
	NkJNbWLVgPQDCp+l8PV2Kj8wSgJeTiMATio7930dL9czjMguoewt6VMrLcIJ6hkOJLoigxueuT2
	7h/u+Ok6Ko+QLMEzvUkQk1o9hXuzTU6h8Zv21JGEOu/6Rsw4y+V3pzMUYbzc=
X-Gm-Gg: AYBFou1alD9eCeaIJPEcuQ3rdaKxtfGgCemIFuqYBdgPnOB66HVy8vk7HpSk39n724R
	4LidHMMKmPWBN1c7N/p0qAJ1xaWggiQYz9kWB90+9B07zsWhDZD7NAT53QaOWmZcKfKgHaaa6Or
	RnylGwUE/v5asW4dEVBa0pOn/8CVxJAqLibCYdc5B2OZCW9U8FvLcPENiJ8owavSGxEmuHzWfA7
	/QrjhbQmd4NSyCsJMNx+q8djFRUsrmCn5Ue5te9TKBbFxNdrI8bQph46MpjwmSZ9aQl0zB2otsZ
	Q7ZPuCug1zEKZHnwmowq/6EedhFqCci0NUCLjfQG1Fi97tzh0Y0uF/2Ra/vJ0vA0ZVpikj0ZalY
	hMJjaX4w1zg==
X-Received: by 2002:a05:622a:1820:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-53688244eb4mr2593771cf.0.1792447993494; Mon, 19 Oct 2026
 15:13:13 -0700 (PDT)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261008172208.1139281-1-scollyer@google.com> <as8slqeTjJYWOlaa@google.com>
 <CALUcz=3WE+SUx2j8LKFQQK-fMVXdk69rZJ9nKgBMQ_UwnWRPSA@mail.gmail.com> <atWFg7gm_jLBOwxu@google.com>
In-Reply-To: <atWFg7gm_jLBOwxu@google.com>
From: Scott Collyer <scollyer@google.com>
Date: Mon, 19 Oct 2026 15:12:37 -0700
X-Gm-Features: AclHuK_wVZXFfIgAVV23G-YS1NEjeLj8kfINMrQnYb_ex_aJ_zR4mTrr4fQbMKY
Message-ID: <CALUcz=0TtozoU+EP97Pu5pPYc=_G97xM=yR3cZ9WH_kLgrxQoQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: trigger kernel_restart on EC_HOST_EVENT_PANIC
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 7:50=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
    > Please don't top-posting [1].
    >
    > [1] https://www.kernel.org/doc/html/latest/process/submitting-patches=
.html#use-trimmed-interleaved-replies-in-
  email-discussions

    Understood, apologies for the top-posting.

    > I don't think this is the right approach, given that:
    > - cros_ec_handle_event() is a generic event dispatcher for all EC
    >   instances, not a place for device-specific event handling.
    > - The ISH driver or sensor stack should re-establish the state after =
an
    >   ISH panic rather than rebooting the AP.

    That makes sense=E2=80=94the kernel should not dictate system reboot
policy for a peripheral,
    and cros_ec_handle_event() should remain a generic event dispatcher.

    We would like to drop kernel_restart() entirely and instead focus only =
on
    surfacing the EC_HOST_EVENT_PANIC event so that userspace crash reporti=
ng
    daemons can collect the panic dump and handle recovery policy.

    Specifically, for non-ACPI/LPC transports (e.g. MKBP host events
over ISHTP/SPI),
    we would:
    1. Register a subscriber on ec_dev->event_notifier (e.g., in cros_ec_de=
v) to
       listen for EC_HOST_EVENT_PANIC.
    2. Trigger the existing ec_dev->panic_notifier chain so debugfs flushes=
 any
       pending console logs.
    3. Emit a kobject_uevent (e.g. ERROR=3DPANIC) on the cros_ec device kob=
ject to
       notify userspace crash collectors.

    Does this separation of mechanism and policy align with what you'd like=
 to
    see upstream? If so, would you prefer the event notifier subscriber in
    cros_ec_dev, or is there another location you'd recommend?
