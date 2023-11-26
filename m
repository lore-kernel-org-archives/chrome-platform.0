Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FF210958
	for <chrome-platform@lists.linux.dev>; Sun, 26 Nov 2023 19:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="txEWXNcx"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5cece20f006so13293287b3.3
        for <chrome-platform@lists.linux.dev>; Sun, 26 Nov 2023 11:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1701026554; x=1701631354; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFHEWpGev7djyRHTSiSB9U+u3iCt6795tGx0PSFZ3yw=;
        b=txEWXNcxgGY8s7gyfHq/6QK4dBDqPF4AoODomJvVVR9xbQc03emnW//CsjgD+5NbXp
         Bqy7+RbL4ceKvqq4U6f/ngxY38/w3aj4TWx+iZC2l89icjTYA38W71Ih6Ps4YG+3BvvY
         M9PNbDaaAjYCr75S+xZoWrAU/KKD9flhOGBSTK5w0dkpJxj07hgBlvVJJriC5f07rkgt
         ThNV3NRkCNmELIFDuohuaQ9jjSHxdEjrbiXpwInGRC8gwUBh5U35h/7mgWyT2RrJrmIg
         jppBS5ciKWvw5o9eGxumngPew8Ape0e2lKjKXTLIqaA3wpf+Q2HmXDy2+AqZzwU5ToVa
         MeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701026554; x=1701631354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFHEWpGev7djyRHTSiSB9U+u3iCt6795tGx0PSFZ3yw=;
        b=kGFCLhlk+9TyDHDEbA0lmVNHHc3/A73nIcFKNioVjV/mrz/Lveqb8ARLjACWtrjQ7k
         jYcN/mz5/QtG/s9/ov5GAglW2efrrqkCWfeInv1hkTb0bj2tN5W/6VmPzum4Z2viDoIh
         iBN2Sfn9fw3oRApCkDmSHPJHzT4eDjKNPH2dgNXZs57pfUE3TgGLwLkoIgtDRcx6Lw0c
         uKOd31v8UCPylM0XsMIB5ak0IqIOLuzRfGp8U0hy7ELts3qDm5aGey5ESHQ95Xh16sxg
         7GV8ufJsYQSM27X8b44MpUXlHZq0nMddWGgr5juFKfTW/C5OCsILQhL2cqXqcAscegEX
         RlJg==
X-Gm-Message-State: AOJu0YwQlBogrPQ2Ej4lMnU67V8iyzk+kXF5Lf0e2+0qeA8oYD/wBdpc
	RHhxY6xbMvDvwI0ZxWwlalQOkQvX+PwISu5W6Oj8zA==
X-Google-Smtp-Source: AGHT+IESS786Cto5+N7hxPCKDnIfdvjLY3jmdZOPiJkohNeAnpXapU+HvaclyO2qNrhwqN9Zhj91t+ZwMFyZG0xhiwM=
X-Received: by 2002:a81:451e:0:b0:5cd:de71:f76f with SMTP id
 s30-20020a81451e000000b005cdde71f76fmr8892493ywa.14.1701026553821; Sun, 26
 Nov 2023 11:22:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005160701.19987-1-dustin@howett.net> <ZSYypHZiRXo7qK5_@google.com>
In-Reply-To: <ZSYypHZiRXo7qK5_@google.com>
From: Dustin Howett <dustin@howett.net>
Date: Sun, 26 Nov 2023 13:22:23 -0600
Message-ID: <CA+BfgNL7OeqbXPGf=hk=XrTWoe0_Wv0pi95YgWw5SJjzs8EXeQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] cros_ec: add support for newer versions of the
 Framework Laptop
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, Kieran Levin <ktl@frame.work>, 
	Mario Limonciello <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 12:29=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Thu, Oct 05, 2023 at 11:06:57AM -0500, Dustin L. Howett wrote:
> I don't understand the description about 0x8FF.  From patches in the seri=
es,
> it looks like 0x8FF is unused if CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVAT=
ION.

You're right, this is unclear.

The ACPI node for [...]EC0 only claims to use 0x800 to 0x8FE -
*however*, the EC does use 0x8FF!
The bug is only in the ACPI table.
The quirk is used so that devm_request_region doesn't fail
because it would try to reserve up to 0x8FF.

Does that make it clearer? I have been struggling to reword this for a
while. Hah.
I tried to explain this better in the patch bodies.

I have been considering a different form for this quirk.
Right now, it means "do not reserve 0x8ff, but continue to USE 0x8ff".
Perhaps "ignore devm_request_region failures" is a better quirk? It
felt too broad.

>
> > Dustin L. Howett (4):
> > [...]
>
> The series should prefix with "platform/chrome: cros_ec_lpc".

Fixed. Sending an updated patch series that addresses yours and other
folks' comments across the entire series.

Thanks for the review,
d
