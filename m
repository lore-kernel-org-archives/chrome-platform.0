Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3637604F
	for <chrome-platform@lists.linux.dev>; Sun,  2 Jun 2024 23:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717371632; cv=none; b=tQWdKIqhYMLMFdGW5Qbi6dWYF6iO7+7zzwShV1utAhodxerHN5XL+J0BSd75MMwXxiXIw52vTQnac6Vn21LgHZ2lWdZhxS9KCROHNRVmWet+6VQNUtIAZBFWcmFzNPrBlBQh/+msRRDo7z2NKs7INfGnOVhVtodnlKlIDj0DZFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717371632; c=relaxed/simple;
	bh=EHRepVezwMfVoPL6Mw07oqATYl7aotVo1rQYOCPwKrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txBj1+hRVCe+abUJ2Vv9UA4+gU6yx6YRex0DWGOINMeTyujjt7+AdhVPgUHMl6QMOQaFx18eVtlpRWarNkpDcGeFMNPq0CfGbC0rmfXee50xGy5cGp+B1vUomGGgYwD7VBEknoe5aHUcecLc03syNB8SuDlopOqOqJi7D3Veo9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b=vVBZVV4O; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="vVBZVV4O"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfa8427f22dso1663940276.0
        for <chrome-platform@lists.linux.dev>; Sun, 02 Jun 2024 16:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1717371630; x=1717976430; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kB05bl6nBL/GV64EJffHVt909Yg9H0aq3pdV1Zuvdyk=;
        b=vVBZVV4OCthD8JWE9NmyxhewzdPayj9eYOXZcj7LKvpUqetIzk0oG3mU9qVtOfsWDI
         U4OnDpibU8FfAi5pLylzwQefkva1FjpAWwjiwcPdzCaWZJB7X18CQ5OqpivRn/lIwRZv
         mGzcZOl9Mw44/hGxkgT75absW/qRaUukNWt+V/aic1Xqd1x27VSyIWsKILzNU9H05aPz
         nnwVAP+LBqo38uIM7Urg/+Y1B0nwT4JQS5ff4pscSlGDLZRslCOMCatFTOq7srnnhGIy
         Kmnz/EsYQszLGluNkWilh3mOEH0OWB8Pewyo80i4Fe1+xBEgZK67tg5CpyMZZhodIots
         F01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717371630; x=1717976430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kB05bl6nBL/GV64EJffHVt909Yg9H0aq3pdV1Zuvdyk=;
        b=qhivDRvO+U2T34jvrzYQuorwwZRpuTt5LH6HcWtdHwWue2mjks/MHdpsqvh9kQ7Ty5
         sB3T12lk++8hMH3RECdLtjw8ctU56Lh+EoISkd47ui3j9XwDnf/s64wqWVNVOHORGPYC
         g3RI4cOTRv5B4UjZtm6Z048ZDqRkZvGLen2/Alxl4Ie4qWVkQxahpNFt+aGRTu7eGpBp
         b/vgQpu+EGqRouuSyBgdGo8smfZH+NnDzCUy3w4g9bcbit8WDD1f7dGi2RGEbZBxaaV6
         Oi3NXVr/Hb3JIk/rXjWvp4G7GuxjeHhe0TMBo8OwPutNkjbeA1qlFZH2AxKlOUzl4KqB
         2HIg==
X-Forwarded-Encrypted: i=1; AJvYcCUgN8F/6zys3bbtS1vJqUxO44lsPR3808Ss1uXrbXb+FR7xINBpPE4d5QqHcR+d6+TP0jlEvM3H2/1UcgIa3845tEHhwAo+bsI7aT57KRXT
X-Gm-Message-State: AOJu0YyJgvwuj6ECjFaL/0Pzmj9Rd7gkMBPM94RpBQY/znybLCnVXJoD
	kizQFqIf7NjsWOfGbiEo3aRo24sP0HEo0tcBoxNtZ+1pm9OC6x+FUWSMb/JrXeQqJItDbDdj+8V
	xVTGwojjouSQLB0MEyt5FcNSwRnYXk3NH4IuY
X-Google-Smtp-Source: AGHT+IFdFbO/JdCzTUHIjfXmLV6Vnd6UNkZHgxfb8QNHaFRuKatU9hk38ie3OnpmMurJr4aQmZNPxtlWwl7vAEgGwFw=
X-Received: by 2002:a25:d890:0:b0:dfa:5a2f:9e56 with SMTP id
 3f1490d57ef6-dfa73bed87emr6826339276.6.1717371629757; Sun, 02 Jun 2024
 16:40:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240528-cros_ec-charge-control-v2-0-81fb27e1cff4@weissschuh.net>
In-Reply-To: <20240528-cros_ec-charge-control-v2-0-81fb27e1cff4@weissschuh.net>
From: Dustin Howett <dustin@howett.net>
Date: Sun, 2 Jun 2024 18:40:18 -0500
Message-ID: <CA+BfgNJByawxkZukaCXYcmOo_K9aQ0W1x8B6Y+Hyg_fZaJ4axw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ChromeOS Embedded Controller charge control driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Stephen Horvath <s.horvath@outlook.com.au>, Rajas Paranjpe <paranjperajas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 3:05=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> Add a power supply driver that supports charge thresholds and behaviour
> configuration.
>
> This is a complete rework of
> "platform/chrome: cros_ec_framework_laptop: new driver" [0], which used
> Framework specific EC commands.
>
> The driver propsed in this series only uses upstream CrOS functionality.
>
> Tested on a Framework 13 AMD, Firmware 3.05.
>

I've tested this out on the Framework Laptop 13, 11th gen intel core
and AMD Ryzen 7040 editions.

The problem is that the AMD framework laptop *reports* support for the
CrOS charge controller, but it does not truly support it.
As with the 11th Gen Intel Core (and by proxy the 12th, 13th) it still
does require the OEM-specific command.

This is evinced by a mismatch between the firmware-configured value
and the value reported by the charge control subsystem through this
driver.

$ cat /sys/class/power_supply/BAT1/charge_control_end_threshold
100

$ ectool raw 0x3E03 b8 # OEM command 0x3E03 with BIT(3) in the payload
is Framework's charge limit query host command
Read 2 bytes
 50 00                                           |P.              |
(in my case, 80 in decimal)

The charge limit is managed at [1], and it does not appear to
integrate with the standard charge control machinery.

I'll pursue getting this board not to report support for CrOS charge
control. This driver is still entirely fit for purpose, just not for
this board.

Cheers,
d
