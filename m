Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA9253E15
	for <chrome-platform@lists.linux.dev>; Sun,  2 Jun 2024 23:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717371019; cv=none; b=Ql7IJutxYPZujXizfDcyBhGlD5p9nvSbpip02X3CzxGCLwLEJxWk6M8Gmg/pYph+/ulZkWxsy50nb5tfZ4iGLG8jWKwYhbhG4nfLvI/tRnPtcLEfz4LaJTr9NnGzMrZtKAB1JVDxPx9y2islPW1pEAuZFX6m+wYSqs82X1dHGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717371019; c=relaxed/simple;
	bh=pMhsyKu03RmnmNJkv3yey1MD984VPwGhQB3gl4lX4tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLPOs5VkUufRYKsihiBA0y0mNW1fAxqmZ1agZP84cL2JvrcC+0XE6kPR9VTDE8dcL/cZtKroq4zR6Qj/DSw+akBllmd4eYTnAwlpytKF/E4w1xKBAYp+A9/up4By5dVfXjfDggvDzBOiUYusIkC1YftWfsSDcykgoSPQwvwCFkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b=zSN2GOkB; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="zSN2GOkB"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfa5b9274feso4126774276.2
        for <chrome-platform@lists.linux.dev>; Sun, 02 Jun 2024 16:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1717371017; x=1717975817; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mA62qSvfUgabP8dHNNLvavVQ1hj8KoRhl88lff9+uKA=;
        b=zSN2GOkBdZzRJCmhFG9/IahSfDnivJHa07Kv71J1XohCJBiXKYTHOyC5SF1LK3jSd3
         zw4fyRuR6GX+fc3SMEVZw7ZPYyjL9kIa0kFzanC+nd2zrpxG1UQMWfIBYybFtkKv5GD+
         jNTLWODQdjAQSdJjno/xCC+T7TlsEW9MUY+A/0HLJQ1/sMz10nm+wpol+rY3/kuX4SWS
         O5M8fm9RmCQDcfepVETZ7TpEmJG5jfUHF0FnfNdJy8s30m8zzyUECj+iw/9cxyYNbA+B
         5faCmBxx1gSvE5VTw6CfQvkCIxrQdAkKEoDWWCbR3zxd0ZcPQ2VYPbXxhWr/VdQa2wlf
         8k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717371017; x=1717975817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mA62qSvfUgabP8dHNNLvavVQ1hj8KoRhl88lff9+uKA=;
        b=uhume9mHiVoSM/1fEzSou3IpLs2hTlYXivF3z5Z5XKLhL7vO9gsvSX+Hcjkt8vtlXp
         DAb0D4zoWU5r89nUaSrWOerl+4dD0AUeO9Ct7j9Zx38QOeQdG26GW6xIkpxvDLmZEGAa
         i08UwlVNPUfrQThof50dkoVOObcTUmHnZaBQDyMtBSi23Y6ux2eqT8o4QJ2b8ahuISHD
         i0DDpvYtAA4877Cl7bpc5S1Xk4oplmju1AS5PsAJDoGtXAwnBxZPESwuxSqpwYb7BlIV
         Z+w9r0TJAwknQG3gf/Yc/4u6xrxHG9UqMa8nhooQCqoZngOT/QO8RfOyBiNqYCD751sK
         9Iuw==
X-Forwarded-Encrypted: i=1; AJvYcCWL2ANbCZ/dO4Gdy8EUir2AcnnH30OLQrmsS5TnsAgNMlBUpTxH9WlvXtargjHvjvriXQPw4hwK/r1cxNkv1Myp+ANUT/H00SkfcbRECAv3
X-Gm-Message-State: AOJu0YyEy5MW/miqSDjY8mrct0WKE/Is9gO1NEntkbWp/PrcnipHz0QX
	T0+rf8WDBt65fuJUotJ2XTSyUK74obhjUIADJM6c3GyUVHoGRKvMH6js4h6vDd47OzTEqLk2E3b
	RGPJL/QW3dDg+/6Wzx8xqA1Lyx6SKm5j5KN/3
X-Google-Smtp-Source: AGHT+IH2wwVcPgtl3GNQdMf+HzL/lgwUkqm8BGFm5dIJFA3xpzq6zxsZqPM2NhtHVxlko5L+l8gNF8Ck50mvlyjfVRI=
X-Received: by 2002:a25:bc08:0:b0:df7:978a:73de with SMTP id
 3f1490d57ef6-dfa73c1da12mr7346043276.19.1717371017435; Sun, 02 Jun 2024
 16:30:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net>
In-Reply-To: <20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net>
From: Dustin Howett <dustin@howett.net>
Date: Sun, 2 Jun 2024 18:30:06 -0500
Message-ID: <CA+BfgNJf1Av7fRVUjpU3r6aRw6DWTHfkCuOYXP2ykhPzGTVzfw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ChromeOS Embedded Controller LED driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 11:33=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weiss=
schuh.net> wrote:
>
> Add a LED driver that supports the LED devices exposed by the
> ChromeOS Embedded Controller.

I've tested this out on the Framework Laptop 13, 11th gen intel core
and AMD Ryzen 7040 editions.

It works fairly well! I found a couple minor issues in day-to-day use:

- Restoring the trigger to chromeos-auto does not always put the EC
back in control, e.g. the side lights no longer return to reporting
charge status.
  I believe this happens when you move from any trigger except "none"
to chromeos-auto, without first setting "none".
- The multicolor intensities report 6x 100 by default; if you set the
brightness with the intensities set as such, it becomes only red. I
would have
  expected intensities of 100 0 0 0 0 0 if that were the case

Thomas, I apologize for the duplicate message; my mail client config
here defaults to "reply" rather than "reply all."

Thanks,
Dustin

>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>
