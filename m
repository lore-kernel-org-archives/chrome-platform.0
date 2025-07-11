Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F9A21CC5D
	for <chrome-platform@lists.linux.dev>; Fri, 11 Jul 2025 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752249619; cv=none; b=hnfhWA6Jy+A3Yhsd8JQRXlvwRwlqq8O5jEXM5zrludTxOKYP0X1gsQQSLGZVUvbUZQI8rMl8o9C4KFQMPfKjhT0xJ2VvStk6QbAIzPVkJ+lUTfMHWmGYnKiDE+WaX3mMsVjmUCuIwu0lNZcKuFYiMQh0h4nV6EqKzk2OXW63oLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752249619; c=relaxed/simple;
	bh=ilXSp1dPDBPZtY0cNIzwyHE0LKQ/bY1ESho4fUW0cyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iq01Uu1HsWE9BdsusMs7yqDdaGCgRH4caSCm6bhe3rGMcwaB/+4MQzPVb/N7EUHKvFiYIcU1/1QrKQy0HS0knCb89s+4UeouGmVGhLRTSwRcZGYRHrvB0kwyj4l1WNfebOMVIk8g431mRRCem7UzN5hDGohHm9BsgwOI30lVi/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aBtlJ5DY; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aBtlJ5DY"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70f147b5a52so17260637b3.3
        for <chrome-platform@lists.linux.dev>; Fri, 11 Jul 2025 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752249616; x=1752854416; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XCB6CevJ1bK/c1vVbFc4dLpz9PDilKCAUnF2cmyMuTI=;
        b=aBtlJ5DYGP3DcX6v0tYHYOmjiTsmNG3DWjnvSV+XjCJQyygpeEW7+r+OrX6+Wao5/V
         agiTOdJzapv10QlazPcaxf9jzGIM6dNUN2KdwMAycLD2Zj7jgwAKqIsv/BgNigDD40LR
         sf8VAes6Kg3CHB2D0/73sFcid4e9BS8oSuW7oL2oCJ1FBBKu7Mbodh5nAA857qK1HF9P
         Dy7xxUx+axhPqGZqOloqnUDprzncSGXOE4k8STqD7M9wI5dwC7314MpI2E71bpdl0hJJ
         x3BcCb2YYxeq0dsIhiloWFdIH5+1QEGydLMif7yDp7Y3VEn/YyWbR8ISaQRkT/SSb2Xu
         0+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752249616; x=1752854416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCB6CevJ1bK/c1vVbFc4dLpz9PDilKCAUnF2cmyMuTI=;
        b=qn7Up5sioIfsR08c4Wq4iw8aqZjpLYDubF2BPcqxkwEdZYelDgPVCN401FDsIvfNur
         A5sCMsHlunOKNfKUMF87gOsJCWLyZxN7Jw7XWCZjz68LBPOgCmqdKDqRjVvwN49I9H5X
         RqET9jVZfGHUfK3Il7prH+RbNL+I0UtufCxrBSkLPFwVA7Q6nfdZs24hpWofKnzqMfFy
         29p4uKIZBDrGXEbvHLPzl4jodJCPfxJCSzGHwKoSilAtUHzmN3kBy+id43DOkqFR434O
         Xh3KQXfI/oewWuzakg6pPTXtTXi0Fik/fGXkZHXrPboMyQvbofLTpvr8LwnZsbtlcD/D
         B1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWcIhklEk5wrLmsTDynw4tmhz+13Fe1Q9Y3OBR4SDkC5/kfGTHnx0oyuFruwqf06C6sfkF3I5B0ZOrM4BSHYTk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpb4aBxrlnS7BC430KEsW+TYjBUSNv1KF4L2+2xsjWg0g7kkVH
	h2ORrMsQtVdsVTDi2Jbkky/mCuFv89nb4Q865zRpkngMLWIffaNgdSNIMPFAmx9SqO1dGX4O1bR
	pWF/O8cpcVO/HVzhz+cfeEO7Hc5gKlxLJvwTxx459
X-Gm-Gg: ASbGncsF0WAKgeuCwkaerbIDRplpLzeX8pd+znmIzP7lIgcha1sl7rXevLFwtTwp3su
	jBsxwiHA3dM5U9rUFeaGP2N48JI73i4iWh5Sufvw1Tm0H4q3lLEe07VNk7srqrvCekJaOt/hEpf
	oMziLBz8zPb94li/LFrTN1CHdmzpfv5DToQ/Ev5ExWB7u4ixHXWT2gWwbeR6GqxfECEM5YWLZiw
	pAOEQze
X-Google-Smtp-Source: AGHT+IFfR/cNNJjg4+RIPxVvQVW40HsZqZMjcC9Rp74qm/udkO1oyGvobFpgvO5YmPcZPMOvEQXWO1WB1r67pOQA9M0=
X-Received: by 2002:a05:690c:7092:b0:710:e4c4:a938 with SMTP id
 00721157ae682-717d5e367a4mr64185537b3.38.1752249616214; Fri, 11 Jul 2025
 09:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624110028.409318-1-dawidn@google.com> <aF5N5jrRUlj3SUGS@google.com>
 <CAJ_BA_CppC58kc-Uv49PSmWFcCih-ySuGDuRcO5-AWQQqcqWVQ@mail.gmail.com>
 <aGOiu-sXFj1EUQAB@google.com> <CAJ_BA_CZWvC2=i8riNe5LReLKzPXK1vPwymiG2dzLEntda7TRg@mail.gmail.com>
 <aGSuS81Psqm_Ie4N@google.com> <CAJ_BA_BQOQe61r9t9rL=UiOqpHwOoTSbQcZNe=CrCcjMha_YQg@mail.gmail.com>
 <aGZrhe8Ku7eEIRqm@google.com> <CAJ_BA_AMaz0GWxOHJYws95h3fRdErghqUXPBkhrB1_eYegOJ0A@mail.gmail.com>
 <aG4zf8rGnmt5xVtG@google.com>
In-Reply-To: <aG4zf8rGnmt5xVtG@google.com>
From: =?UTF-8?Q?Dawid_Nied=C5=BAwiecki?= <dawidn@google.com>
Date: Fri, 11 Jul 2025 18:00:04 +0200
X-Gm-Features: Ac12FXwc_XLYukHrauxzKnmHKi0DZp27r9JC4VLYNd_vnFbqd6Py-pnUP9LBjK0
Message-ID: <CAJ_BA_BmPXrMqP1VxAAGDoWHffsU2pjnuYRO3MhCb=VRq-hS+Q@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Add ChromeOS EC USB driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Resending due to HTML incident

>FWIW: It depends on the bus details.  If you find my previous message, SCP
>over RPMSG also re-registers everytime after the firmware reboot.

You are right. But I'm not sure if it is a good approach. My understanding is
that the HAL/API should behave the same way, regardless of what interface
is behind.

>One challenge for current version: it makes the driver more complicated than
>others.  E.g. what would be happening if some friend drivers try to access
>`ec_dev` while the `cros_ec_usb_probe` is writing to `ec_usb` at a time?
>It tries to manage the device's lifecycle one level upper than USB (don't
>know what it should call, "session"?).

Yes, the more complicated driver is for sure not a good thing.
In that case, it shouldn't cause anything wrong. The disconnect field is set to
false once everything is ready. Before that, there are no transfers handled.

>Another challenge: it doesn't call cros_ec_unregister() in its driver removal
>entry.  What would be happening if someone re-inserts the module multiple
>times?

That's the same case as reboot/sysjump. We would get the probe callback,
the driver would notice (by Product ID) that this EC device has been already
registered and would replace the USB related structures in the cros_ec_usb
structure and the same cros_X  file would start working again.
