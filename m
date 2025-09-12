Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230B2537E9
	for <chrome-platform@lists.linux.dev>; Fri, 12 Sep 2025 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757684802; cv=none; b=PoE9mD6MA01QG/B0QQ+gu8zqcZ9MsgAJ8LsslIvBXWQOrsrHKJd1L2DrIHH+LlTn9M8Y9HHUYuY8vrPXt7ln8/1QLK5So3n1h713vSeb0UITn/Gql4M8BI15s3H5FHsielOrLgLDcvb6uGtovCV4NdNOtEy/jkHuD6wpu7rUGy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757684802; c=relaxed/simple;
	bh=v4JtY9vSL/ymUzoCEJf8PMANI/JiqvGzFXWGWHS7MS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YtlN9hcVMdAJpb2Iupt2dQCqdNjnhBXYXvesdAPtE26HAvQObh/yBsKMhClm+76v+V1FPGyrriLpMamDEdJl/hTo9aXa17zLhIPX5/OgacxdsQqNE19YMZniUHzzpB938PL3KMZILmGVEB7c1LX3fMxMSBsDjIF0LCJMMy3HenU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JMYJQutY; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JMYJQutY"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-337e714b3b4so15557061fa.0
        for <chrome-platform@lists.linux.dev>; Fri, 12 Sep 2025 06:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757684799; x=1758289599; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4JtY9vSL/ymUzoCEJf8PMANI/JiqvGzFXWGWHS7MS0=;
        b=JMYJQutYMIwP1xYfJnX0yJnTBPLIM4QGNIWMavfNxlfvg9CW0Ms0hWo+sQk9/VN5Px
         H2q1/SpontX2dxn4YaQHFeP8uwjpADOp2BhPXXVgolVh1E8nEAFVIpr9NiO16LrK3iU5
         eqUAYlNwgJB/Hu4+6ACFicT8U8UgpEX8HIhM7mRDb/NkUaEEBhQMm+e8OPeCUJtCHqVL
         AzM+syF20BTKJlGrerUlJDJcg6hB9sq3+AgrZbOvbHKOPeCJyiGIIcjJ+a2SBIDqWdIS
         TGXp3krrDfeLusDTSBHdrXOwoMxgMs2gCJ6DUj4qhSD/E3g1ssMAFQAJywvayV6K7evB
         c7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757684799; x=1758289599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4JtY9vSL/ymUzoCEJf8PMANI/JiqvGzFXWGWHS7MS0=;
        b=Pc9tPn2gZaYiD0mC79lR+qG/66JmkZJQBRHLR5XDM1E7RVbDfr4U4dahG9pAlZJZbI
         yeJq3LJ6aA4TwOTT46ep8UtpWBVHitTs4ZkxfqCLq/++Rnzo/EFvrwD1IyNPB1oDLsDC
         syF3E96oca5ZI3Vj6Ugvuo+Ywh+zcymhaVQhxR8caemN3AS1rcpl9dGBKr+WUQaTPqEi
         KwGA0/f9Hcf7/YDQABwpnpTkTMmRex/EGbyXJvWGL3aUNq1pSHB7RMMR0/hQvHL1E6eI
         c9RSqmsh4gLJvYEeaR4YgRGt9cyzpKFSuDBrYgTwqx/599yuXObWO/gXPflLs4ZbyX4+
         HRzw==
X-Forwarded-Encrypted: i=1; AJvYcCUVBAWVDwCmgtK9SvI6JXw6gGOqyUHKgjvyGn2qEFOCpSuuYmjbDUafkAYNFjPVy/3TefuqAB02cEAOdi4zvpA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd0ND18ATltnl8L2oihFKg9UZRCgzC7XBt6yQ1bbwu2vYgRGn2
	ocV2KAmi/OndroO2Hd1s74ETzHqWToeSNNwrIh6SXA2/YCzGefqHjPu+jNuj18Ob0MmJ9O/ed+R
	A8YjVt5teW8ibcmdSrYhf4ScUhGl3bj+TY2uZToa+WQ==
X-Gm-Gg: ASbGnctdlnu7TsmPUO0T131zvo5pV9v0i4mmHYF9epmNZaFaJ4tHTlujVfqjc82fnnj
	u+B5SjYUJn9ULCZIChd8zkYCWT9nKLEyQtSw9OEnZJagbBAJ6WN9dU/9RPPpAgtu+NVqlPbWjTm
	NxK0fiUj5dtRW9iLq3EEIRfkQl5Tv1KEBfM5rtUXMJOY8xzjAPAabtehTvBZ/sWxi/stXw+l4zY
	eGRQr3ARabBVJpNj4t1w0SsxX/PmkVcLF7nxQ==
X-Google-Smtp-Source: AGHT+IGl0c5/zhdOHSETmwuPRA4tqW6HoSSHPDwaRkjQJteW3bfz+plrHfEmjYRmQh9olW2s5Fl6FKUzor1dOfUjNsc=
X-Received: by 2002:a05:651c:198a:b0:336:e46c:5eea with SMTP id
 38308e7fff4ca-3513ecc4932mr8562981fa.31.1757684799188; Fri, 12 Sep 2025
 06:46:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250912081718.3827390-1-tzungbi@kernel.org> <2033c6cd-4112-4c8a-a9ef-2ab34f3504b8@kernel.org>
 <CACMJSeuKH+WKOXLNU92dMssqhK02xG3z=cT0VeXYM+ZGuPCB9g@mail.gmail.com>
 <aMQW2jUFlx7Iu9U5@tzungbi-laptop> <20250912132656.GC31682@pendragon.ideasonboard.com>
 <2025091209-curfew-safari-f6e0@gregkh>
In-Reply-To: <2025091209-curfew-safari-f6e0@gregkh>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Sep 2025 15:46:27 +0200
X-Gm-Features: Ac12FXyIDSy-eYKyNqWjJQnokOfxXk3HAMgS7Hxbag5ilFR-3-M21SM8Ndw8aGw
Message-ID: <CAMRc=MfdoB50o=3Q2p94o+f7S2Bzr=TAtWWQcDrC5Wf3Q5nqAA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] platform/chrome: Fix a possible UAF via revocable
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Benson Leung <bleung@chromium.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Dawid Niedzwiecki <dawidn@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 3:39=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> I have no objection moving this to the cdev api, BUT given that 'struct
> cdev' is embedded everywhere, I don't think it's going to be a simple
> task, but rather have to be done one-driver-at-a-time like the patch in
> this series does it.
>

I don't think cdev is the right place for this as user-space keeping a
reference to a file-descriptor whose "backend" disappeared is not the
only possible problem. We can easily create a use-case of a USB I2C
expander being used by some in-kernel consumer and then unplugged.
This has nothing to do with the character device. I believe the
sub-system level is the right place for this and every driver
subsystem would have to integrate it separately, taking its various
quirks into account.

Bartosz
