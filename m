Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA6C158A1A
	for <chrome-platform@lists.linux.dev>; Mon,  6 May 2024 18:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715020186; cv=none; b=Qnh3leiZL95Y3i0FRld6KJT0vxv0MI+IbNGWGzGCywJ9ghByh1h1c+nRHbQOPd0O6yVkbZB5oZnEbAAKzbxGxwXhHP6KG+HaC7mRzLMf6K8+zXI7ek8I4jNWSazZZeqo/KWF1yy3KiDi8i/rebTrOUXY0a8NX/fXHWj3ZV+WjYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715020186; c=relaxed/simple;
	bh=VMEFfkoDH6PXpbghcbBsUEOgJ+i0OqrWW52443/7WsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzmSc4EMTRnTQbslRM2P+fONjT+C0ruiUyt/im1VnyJf3WbKDQTaNR74bydT6G71QeP6teywf0rMppivpH8FC9mUCgQORp8bm9ASvuDzBt1VlGC817IFLF0ZdwlSJHUBNhfMR8DDP82nM7btEazffPxg+zpGkpKk2M0Etldq5us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b=Tpqf8kCD; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="Tpqf8kCD"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so2687818276.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 May 2024 11:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1715020184; x=1715624984; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMEFfkoDH6PXpbghcbBsUEOgJ+i0OqrWW52443/7WsQ=;
        b=Tpqf8kCDKFXwkjdFhhkLHrgT7fKpHBxv+KxxbdbFObPxUvS7SCvBIv67tPVKuq+wjY
         wkEYHIcSL2fghFrTSQ7eiOgAyoNjcrcjWYYq/qMfALWMKEiyuyW+XfNiyDY9Qc++k7nj
         2AA6Wfu7lRhXfW8VsbrGNqrGnGJ9qJB1o+pADw3qvmCMqn60S6vJLw14hDw3+YQi3jsj
         OESSq/JKX84fMTV5Hayi1dVzxlBxAwAC8AvFv9wrVK5Yji63W1cY/TSdnvacCwh3NhKG
         axEyMIqO3tcrw6WO6TsEAFURM/+eZJH/lu3ZMZpGZxiD1j/s3YGmnIMPZ5fyZt6fDUJZ
         FvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715020184; x=1715624984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMEFfkoDH6PXpbghcbBsUEOgJ+i0OqrWW52443/7WsQ=;
        b=IGfirFq1VQkN60CNOIq2sPzcWeheHaStluoqGw7WxqGgHs0btcRNCa733qChmf58tk
         uSzIcYgkVgLg1SCkw7+LtfQypgzhkLeiqyy9ublx8rkFFcPoZn6kHu81TunEpnCcyL4B
         3CgFnuiwXcN6uE2XAkXoeGdDRwGqIcKJzNl0fL9rdoqyUoxd15rVyiXP9aGbR6vPiZkJ
         P4OwiklICSdhAOIAT80ku6xW9OjrZQJ+/nvaIrSX0+eSV5WODxGuMAXg0RXrhzCzrUAg
         ILYDIKN5y07g1C6Yl2ncUmB2dLJwFQFoYryth6pkEMKRj9f/zYaVjMmzR9kTtvHya3rI
         h2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVQplcLdCIFsAaglYnYve9dRsYe8pepBOfp14ApzYJcNO+zn7DKUen9foxrdJRpPY4KeOVLPhWU+y4PUSvvMRjJsGvs5Dv9a49UbyE9AP5Z
X-Gm-Message-State: AOJu0Yz44ilXPCLuovjPPBg0IbzCnGJ4OPtMUPIWFBVz3iwR7wLpRVq8
	a59RODi+8pMJDN7dJSLQaFqEjp8n0xpdS3L0NhIrnmukla+ExQxVQWh3hMUkACsqXvmyjhhXyuT
	ZWwVSDI+I8RNqGGI+Y6/KKoTNBqQOmgHaD/k0
X-Google-Smtp-Source: AGHT+IFKtH599jT66vcGOe7xK//4shoSPvp5zpfxCAxNQU5SNOKmbSq03MX2tZ7QAwB6m0gKalMMLW5mPjBsqOv89j4=
X-Received: by 2002:a25:aea2:0:b0:de5:5693:4e96 with SMTP id
 b34-20020a25aea2000000b00de556934e96mr11302424ybj.27.1715020183937; Mon, 06
 May 2024 11:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240505-cros_ec-framework-v1-0-402662d6276b@weissschuh.net>
 <613369f9-42c5-4a59-b83f-45bd1773ffe4@t-8ch.de> <a7ae8fc0-5e53-487a-86c6-f49dc6623688@amd.com>
 <e716716e-87fe-46f5-8ea9-5f649f1da11b@t-8ch.de>
In-Reply-To: <e716716e-87fe-46f5-8ea9-5f649f1da11b@t-8ch.de>
From: Dustin Howett <dustin@howett.net>
Date: Mon, 6 May 2024 13:29:32 -0500
Message-ID: <CA+BfgNJzazn55wUMzjX=thqZGYz0LYU4cnO1Pn8U80B5FrSvxQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] platform/chrome: cros_ec_framework_laptop: new driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "Limonciello, Mario" <mario.limonciello@amd.com>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 12:43=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> On 2024-05-06 08:09:07+0000, Limonciello, Mario wrote:
> >
> >
> > On 5/6/2024 1:09 AM, Thomas Wei=C3=9Fschuh wrote:
> > > On 2024-05-05 22:56:33+0000, Thomas Wei=C3=9Fschuh wrote:
> > > > Framework Laptops are using embedded controller firmware based on t=
he
> > > > ChromeOS EC project.
> > > > In addition to the standard upstream commands some vendor-specific
> > > > commands are implemented.
> > > >
> > > > Add a driver that implements battery charge thresholds using these
> > > > custom commands.
> > >
> > > It turns out that standard ChromesOS EC defines EC_CMD_CHARGE_CONTROL=
.
> > > The kernel headers however only define v1 of the protocol, which is v=
ery
> > > limited.
> > >
> > > But in the upstream firmware repo there is a v3 which is much better.
> > >
> > > The Framework laptop only implements v2 which is also fine.
> > > Given that v3 was only introduced late last year, it seems better to
> > > stick to v2 anyways for now.
> > >
> > > So please disregard Patch 2, I'll see on how to use this via a normal
> > > cros_ec driver.
> > >
> > > There are some other Framework-only features that will use Patch 1,
> > > so feedback for that would still be good.
> >
> > What other kinds of features do you have in mind?
>

Definitely privacy switch reporting belongs in a driver like this.

Overall, I'm not sure about making it a subjugate driver under the
cros_ec_mfd virtual "bus"... even though a lot of the features take a
dependency on cros_ec.
Doing so centralizes the work in the platform-chrome tree and may
serve as a guidepost for any future laptop OEMs that derive their
embedded controller firmware from ChromeOS's.
If the owners of this tree sign off on that, that's awesome! I'd be
concerned about making it all their responsibility.

I may be a bit biased, as I have been working on a driver of my own[1]
for this purpose. It currently supports battery charge limiting[3],
reporting fan speed via hwmon, the keyboard backlight[2], and has an
open pull request that exposes the status of the privacy switches.

It is destined--once I find the time to clean it up--for
drivers\platforms\x86 instead of ...\chrome.

This may be a good place for us to combine our efforts!
d

[1] https://github.com/DHowett/framework-laptop-kmod
[2] I found that the Azalea did not report its keyboard backlight
values through the standard cros ec KBLIGHT interface like hx20/30
did, so the driver as it stands implements a fallback that uses the
raw PWM state. I'm sure that you'd've noticed this if it was still
true... so I am always happy to drop an unnecessary workaround. :)
[3] Which I believe still requires a special host command and is not
integrated into the charge manager, at least as of Azalea/Lotus and
_definitely_ not as of hx20/30!

> [...]
>
> > [..]
>
> Thomas
