Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37959DF59
	for <chrome-platform@lists.linux.dev>; Wed,  5 Jun 2024 01:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717550892; cv=none; b=uCu4JgvgQl5atw8jB7avj5FXThJ2IiNYoWrL83Wdi1JY1Pd2ydMrHAjwmNpAliiMJtOcegqM9Wiu5118nrL2IwE4Fjfu7Y+/MlxXJZkRKDURRG6djA4+eioi3IhUAXtP0ywWStx6g9T2+lAgc6F147LYwiPp9AoHvfOHpYyfgy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717550892; c=relaxed/simple;
	bh=1aAtN/3z/CC+KoX4/Uc468gsc1Odb+4pk0TbWNTH5rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjtQNcXdM4WYmqSUCD/u2/UiXRJVJTxrgQkE4uS1IT3tjFh4bZL+MAQ/JENP1HRe8DkshjrJJVReF7m9XWlDzsWQc3dt+JXlhoGNqhXf2Bj4bNE5mIktJuO9UlkvL6HbfI6yByRlfLhorHrUT+CGcDAJCJNkNuHHfaiP4QaI584=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b=sYXd4ibN; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="sYXd4ibN"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfac121b6a6so364843276.0
        for <chrome-platform@lists.linux.dev>; Tue, 04 Jun 2024 18:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1717550889; x=1718155689; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aAtN/3z/CC+KoX4/Uc468gsc1Odb+4pk0TbWNTH5rk=;
        b=sYXd4ibNvCApeRtF3w0x8anKC6O9HmOdSSIve/8gYJAKW4W4huDg77voMC9fL0waqd
         ptjBmXmmUyfsdyJIgs3QCiEdCT8XmrtFArbqO4ff+Nuggvtn2rTW2CCAtwsEEFEcRMQK
         vvp0hQoOPjcbdMz8KAMEVAAhjSeR5zPfwjtynJWlZtWoHjVbxXEpmjXNEOOUvUTE10Ge
         xvMNnR5LATD1jfNPb5OUY36e47onBpZJyONYtd52QyT5SLaWTa1STZ4adGwExjjGYmLh
         9qamocFUlBfhnk3M8+soO0TaRrJ+idcNKI7eaBN/97xvBZfR3+xmHF1SXd6vFRj8KMVj
         1+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717550889; x=1718155689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aAtN/3z/CC+KoX4/Uc468gsc1Odb+4pk0TbWNTH5rk=;
        b=ZKpXovQcsIYT1Eyes0jEpYEY3FZkF1TXtI3JENUUR8cXi5eh4Tb+8CIxyXwXprbs0r
         eTd/YztPPg886WQiWTgoy4b88cPgmKuHrN2KkQEtqQ+GKv9k5d5bli12nElmW2bei77P
         lf46cQSRQR98QUGP2czhTa+f29gfRwit0nmy0QIlQk5HJ1lJ3c/MB060iDqvTS5xHK54
         JLzNrMhdS2bU/oiLv9KLnplgntGs3qdDKNxvx+O1dDOujzD/3PZMUbL8kSMZLvwAHxgl
         rql4dM5Y5IM3xGeOe4xbwpCh484cyHeAM3d5hm74nxgo2imjtQLoNqfIRs7eqV33ZcrG
         Ot0A==
X-Forwarded-Encrypted: i=1; AJvYcCWwA8yrZhC1s52SXSOW+6Z/2hHJa2OXkyQOYPpsIebxsoKiqeIcp+cTYMhK9BweTWIP7g5HqxBnUo5vncwUKzO23uIeQzPNPqR49Y9VsB0B
X-Gm-Message-State: AOJu0YyQWEeuU7HcuTHfHu7gFsuhsPTkeSIy1dsf59HXbuULALabt+m9
	gJnQU9I7R/Tqj6XJw9T+DJzetBWuPpZgXjUciyrzxjUfBmORNgmSAHiXvuz49lXnKH5rWxTFJgs
	0n38JmP3b35FmeZJ5qGdIqttM0osawawNiEAl
X-Google-Smtp-Source: AGHT+IH5b1wkP6S8DAEsGopYfUuPnn0CZWaw+8yynTwvbj2MBk6B92RfrPC2tnzyTU88t/RNBKA5stTuHDy5P/ggUWk=
X-Received: by 2002:a25:bcc6:0:b0:df7:92ed:365e with SMTP id
 3f1490d57ef6-dfac97ce463mr1085810276.26.1717550888977; Tue, 04 Jun 2024
 18:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240528-cros_ec-charge-control-v2-0-81fb27e1cff4@weissschuh.net>
 <CA+BfgNJByawxkZukaCXYcmOo_K9aQ0W1x8B6Y+Hyg_fZaJ4axw@mail.gmail.com> <5baf3caf-dc09-4829-96db-2666fc902710@t-8ch.de>
In-Reply-To: <5baf3caf-dc09-4829-96db-2666fc902710@t-8ch.de>
From: Dustin Howett <dustin@howett.net>
Date: Tue, 4 Jun 2024 20:27:57 -0500
Message-ID: <CA+BfgN+LE3YyF3te4m8sWbtH85tU+ERUDW7YR_BFecusVTAWWw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ChromeOS Embedded Controller charge control driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Mario Limonciello <mario.limonciello@amd.com>, Stephen Horvath <s.horvath@outlook.com.au>, 
	Rajas Paranjpe <paranjperajas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 3:59=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:
>
> Can you try disabling all of the Framework-specific charge control
> settings and test again?
> Probably the different, disparate logics in the Framework ECs are
> conflicting with each other.

Fascinating! This board does indeed support charge limiting through
both interfaces. It looks like the most recently set one wins for a
time.

The UEFI setup utility only sets the framework-specific charge limit value.

We should probably find some way to converge them, for all of the
supported Framework Laptop programs.

> Thomas
