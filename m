Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C00C24B28
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jun 2026 03:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781840380; cv=pass; b=bjdajOlJANta5RrivtV/t8CoLYnKsrQDDxK/b69lkW2LON93ZAGNmCNhQIVF+sGTt/8WRkqzgwhBzi3BAq+ak+VfttDlmnydq81Yxc5/Gpo2+OFEqwdWhPak+ND82Im1VocIhzyrNw9XEcjBFKNKzjRVZP0OixZ2nTt7n/pSUI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781840380; c=relaxed/simple;
	bh=aWZZgtbpXIshkE9bCgnCK3GkZffa1/P8Gx0sokR8uqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErT/ykYKvXzp7ryxlyIe/Z+135AGbpf+D65CYziO8HMHraJ/qGYSKoUcoqoAqxTVNv0bY8drETyCU9AdSysOMNmJnKXuwhS9/AA2v+CAvtUQ0Hz8ewSz0tsKJZLPDCWVpjczqlnPftBtKfwMolmSrw34LegQTxdD0EqIVfrwtI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXrjnjiX; arc=pass smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXrjnjiX"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-915b5ce94c7so202614785a.2
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 20:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781840378; cv=none;
        d=google.com; s=arc-20240605;
        b=KKl8gZoG+NqTOl9dhItFQ58oWbe9HXQv/mcZ9La9FPpPplGy7QigQz8OftOFcI6F95
         9UBWgnGJfeGJ76sniOykbqp8KLlM0gKZPG5S05+zKKUeHZBzpxJ9ZMT0iWlzT0nZsEJV
         dZ5l9Ipi4Irxea5sf1Cg1yOcr3ugH0DoYGWgQ5TAORHjYN1lYCP+NjnO0lhYZhBHM0TU
         Yz89wV9XIwz0DCLBDwYUP3EmDTSnD4CcNlbrzmX07JUEQv6P/uCr1jWTHTHoG8C3xpn8
         e1vqc5ylzj3VkQHknL3Xsl1pan+24eNfd+gxobsajzNUEl/a1nFsFtDiNyvPjPVin4ne
         JxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mUT/K/oe9nHsUaCI80DqiAL01RtNB1oKHwnJR1yaXxw=;
        fh=nsvq4xGoiePi6C7QF9Vs4MGBGNtAiWb/a3LYdW6Jpyg=;
        b=jib96gfiGNPSoAOC58hWAnITZCR/AYPnHlwZHJFsifUCdAtKNGLPWcC1Th5lS7xrlU
         e/mu8t7KLSsX2GLh4NKODra1YDL82fnedK2ZjtmWKX3qZwVr/LfQxq4fK4lmOmugh5CN
         b4IIDU3LNFiTrZ/7tynPUmGeHpcBFJfd4LCFDrxobqvg2tNiekdSJMCS9QThullGXoPR
         O2WMGBkeILfSYh9/BnblBkrBvmFEQa7HKb0hz1yXXtJR9mbMYN2/K4cxNaO9HA4DX0Tq
         FBpf5OYmiFtnqncVbb3ep4mAYNmJaZa/+srK9ljMSHAwgE85Sf1LRzrWzb0l/lUic8U2
         q1Ag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781840378; x=1782445178; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUT/K/oe9nHsUaCI80DqiAL01RtNB1oKHwnJR1yaXxw=;
        b=TXrjnjiXMYCcPUyrDBomvzoHImSxGwxYg60GW6QGPvkPOV+zTKmmPG+eIkuEifbnQS
         NQDQM9UNt4uO0DEChibgC35vze8ps7cjWT0mi9vxL8h06BGJBBwL99vMepkUDcnkE/ws
         Zvz95e3v6XgZMgxZ4jHInaMgxdyRy6xMmnmb807kywuBg0oWuaQWVxDDF9jldkQFR8U6
         /CAHX1LJc58BbZCd5NbD0c3p848k0Mz2tMKn6aqnzvfAFZbbgA9EsUIXinx71va11rJq
         WJbRUchdNG4ARKJvhngA3pxgzEaxQ2f4AyxU+vigKLshDQXuWaaq/sj3Yy8ZTzPHVNk9
         hnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781840378; x=1782445178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mUT/K/oe9nHsUaCI80DqiAL01RtNB1oKHwnJR1yaXxw=;
        b=iNx3mCV7xbzJ2wls3zcgxixAFwt425GeaYtlidFSVwELjq74021Mr7nFvAR8FxQpXF
         3Cyn1UpMo1R12GLn8vsDq9ZWIMAh4Txi7jK/fXRkXkrltjxWnJZKIid4pJvWGp1sfJZP
         TgfWa/56w/g7gexLjl1wicAKWnCBHijnFtpfEHDOvzJA5g8sgUuAuDsfG/X328z/FZKx
         TCZxSx8VlAUgOYapX8SAnovaR81i1fhU9RdiaKxeNDWQRo8L/ATyUgokSUMA3E6ZLvfx
         10M0EtoYhzOs+cuOUHA7wL2uDNte7YjxMyQXiFQ+o1DHVx0VgiXgCrwPQVkxoKN8jzS9
         clZA==
X-Forwarded-Encrypted: i=1; AFNElJ99XmK8RMEAoceaKtCsinhI7KU5+XluZ/Zo0Ar71on3mlPhWys6+ThBewDtdxI8hkxI7pPMRcDpAkuM+l3SVgM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCayVqvio6YryTJDXcdxfS630rtWvbtT2mxHY+k3eMbL+2OUFc
	V2s3SBuDMvSbTK/mgpHpUum+IlE/oA7DaZVZgZMTn4p1wX/spB0i8jyNs1x3BJQJSl4BvI/FVT3
	9MmwH+7fDrhYixVOaC/4fnQELVlmPSmI=
X-Gm-Gg: AfdE7ckFMJ0IBtT2NBei5a3F6LgpEBCGgfiPskrSG+sv8jpI33as+mrloKQujXc27cC
	8nnHt89qaTOipQtYSPoR4keIz/W1ZCy/mb/eZccikWTbnPVzoacqcOSboUvPsaT+/1zBaUXdxUz
	SQPyplebLLsJcEYiDkNpXBRU82umJ3ki3sXxvnevUTtna3TJV4iQ5/XDJI07fAvg6PMcs0xoPsy
	Ub3WfOe4+3TSTqoluL5WSYvZhtBHeDzDDCf6+5Bq8nxTyqQrArtn8JLQ1uu5wEuOZNHmabTQ07L
	sdxis7gvJ0fwRNczGfRWqknDciLTJKHCf3MUncQ9frPCIUxJubIUie1TRw==
X-Received: by 2002:a05:620a:4587:b0:915:8f76:8005 with SMTP id
 af79cd13be357-920910a5ff2mr287428785a.47.1781840378312; Thu, 18 Jun 2026
 20:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616001411.66231-1-enelsonmoore@gmail.com> <ajCpYqXs8-yi6Mw-@google.com>
In-Reply-To: <ajCpYqXs8-yi6Mw-@google.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Thu, 18 Jun 2026 20:39:26 -0700
X-Gm-Features: AVVi8CfWS3gThLspAlmjUf2sjIdv9hyZ0bmy3gFIQY4Rn5YGawFQvOtxC3SLVDo
Message-ID: <CADkSEUgRvHMKy-7h6cTw-TqbpNiFZeSBXxXjhKgVfY3p3kp90w@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: remove reference to nonexistent CONFIG_SLEEP_TIMEOUT_MS
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Sung-Chi Li <lschyi@chromium.org>, 
	chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tzung-Bi,

On Mon, Jun 15, 2026 at 6:39=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
> NACK.  This file is intended to stay in sync with the EC firmware header[=
1].
> While the CONFIG_SLEEP_TIMEOUT_MS is indeed unfortunate for a non-Kconfig
> macro in the kernel, we have historically kept it for consistency with th=
e
> firmware code[2]."
>
> [1] https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads=
/main/include/ec_commands.h#5248
> [2] https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads=
/main/include/config.h#7178

Thank you for explaining this. There are a few other suspect CONFIG_*
symbol uses in Chrome EC code; I will check if they are also used by
the EC firmware before submitting patches to remove them.

Ethan
