Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2713451C4
	for <chrome-platform@lists.linux.dev>; Fri,  5 Sep 2025 11:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073215; cv=none; b=TI3abX++4/SJe83x8Vk9f8e8FxhGRm6lH5k74rQ2VMb/Wht+OYbIKRca5aRPQuk3G9yVW1QnqSCQKlho3NaBlGmxJdLW68b2MQI+TjcMFZx4pAho4MubpR6Q56qj+qZH46YMBwQ5IijTyEZ6Hk9EHNl5rXf3ENBS9zrpN+d/Iw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073215; c=relaxed/simple;
	bh=tXTx0khqBmsWWU+P4PnW2zGkwrJJZK3FQK11Bvgu8Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RawkQAvjuhQSHnKtc1bvw8wOwPco42fGJFLaR+9yJ6LYoxrQG7eqnmWF+tyBLti/a78iA69ZtrA4HSWG6RevdXwDg0eZEYnjQOWq1izBE4nx2+1ueCFSBQ4RH8I6qVULIX2Eq3sJlGWQYCFGuekqeU1TNiT8A2yFhBu8qlarb00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ecZ86WIZ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ecZ86WIZ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b4c29d2ea05so2251367a12.0
        for <chrome-platform@lists.linux.dev>; Fri, 05 Sep 2025 04:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757073213; x=1757678013; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F41JthKB4C65sSuKjAh9iAVTRgSsULVhOOzeHvyaTPE=;
        b=ecZ86WIZ03Rx13Lqv3tXHKGV2CZUIW2sKUcJJleZXi2yvFT3+XWrQhsCi3+dv35Wl3
         +5zQ/ixrIrgtiW+YwhzhiZngIJGcL0sq1tHcS4Kdi0b1vFf/uTKXODgpfxNjXbrM9CC3
         Tydm/TzA+CjJjS2CtflzjQkDTzVlsJ3wrID3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073213; x=1757678013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F41JthKB4C65sSuKjAh9iAVTRgSsULVhOOzeHvyaTPE=;
        b=gHblPSKMboz+a7sxbJdkTjqGeo/inWF1kET3jIu2+1U8CtWjlE7JeXz454rQc9LQoi
         tHARd0TqRQDvM0UP8/BNIbLgOi5lBXCNN59L66G8kRZB1TsnzsJrNCfKGfCAgLKbCN68
         45D8OhCOEz8LTdEHrOQV2n8jrTu4KQ/LYZJE7/sRMG2gpXNg3n0HtM1tPBLs+lRjNr2s
         NwfpoclUclskyEexA3ie3IGy85SZLPuS/6sH1frp9ZStfw1XlGlNbrMC68GfIbhdt/U/
         oTLNoVL6/PbsTv3auZp1JGb0RIPLRD1CXWmY1Y3uD0EsnO76iJvVVBMafFaCui5jIM5M
         ezKA==
X-Forwarded-Encrypted: i=1; AJvYcCVW8KigT9HfBBnOFu7Wu58e54s/lBX8DBouzrSwYQ1FerRTPrePoBaHH3UreqVVMyEo8i38cw6sNz7XSejvrag=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3JowhyO3e6icrF/3kkKr11k97qIp8qQqNHGj0l6gGi5+xUBoJ
	yPmR+x9L2wXAGHAoAaSbVspIDccC5AnjEfj206nYr08gDPu8/K9FtNp8yRO89sFbFWdXzJCDm8j
	eFMd6LVRZ6MVtV1utgQlIqsBMrbeyDv78eecmqeTmTZCrhu2DxGk=
X-Gm-Gg: ASbGncua5jEXoYfoS5UhYTxBrk58YlvH2Sz2gbHzKgVmni4sAl2f+jJXH6nFZ+JCp/G
	3GO3UQg/2d5dSyBMsJ+rWCAcGM54anKSLTq4xZSK0VJ1WibF5GUbRMZyBoqy1Rp5R5uXX9moTBY
	jepRMjGngfbFUTrCU7LLmyxW7gGvItDPOXUoZcFuZ5vNJSlAqc0zLYxkjHzO/vCCmw1HzIQp0Jm
	ALovqS2xQjxUWhbF2dLOTrVPvnMI3w0EA==
X-Google-Smtp-Source: AGHT+IEN1O0V/duOoV36FoG7uqX93rMwXWpvjMiuL+p5CH98oeicc+oRQqsaUN3czxuXHbTlA0O+Sji4kT9kRYHU9gw=
X-Received: by 2002:a17:90b:1c08:b0:32b:6959:9a84 with SMTP id
 98e67ed59e1d1-32bbe1040a1mr3955599a91.11.1757073213062; Fri, 05 Sep 2025
 04:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250825145750.58820-1-akuchynski@chromium.org>
 <20250825145750.58820-2-akuchynski@chromium.org> <aLq0FCAq-LiB139t@kuha.fi.intel.com>
In-Reply-To: <aLq0FCAq-LiB139t@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Fri, 5 Sep 2025 13:53:20 +0200
X-Gm-Features: Ac12FXwtlyscSNNgxTecVI02owwO8UoR1t0SvM0NbByNpcnkqJWSEDXQoTY3or8
Message-ID: <CAMMMRMeq2-kGZeZUi_UwcUjr_TORYcncgJEqAG5+jX2Hbs-ULA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] usb: typec: Add alt_mode_override field to port property
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 11:57=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Aug 25, 2025 at 02:57:46PM +0000, Andrei Kuchynski wrote:
> > This new field in the port properties dictates whether the Platform Pol=
icy
> > Manager (PPM) allows the OS Policy Manager (OPM) to change the currentl=
y
> > active, negotiated alternate mode.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/class.c | 9 ++++++---
> >  drivers/usb/typec/class.h | 2 ++
> >  include/linux/usb/typec.h | 1 +
> >  3 files changed, 9 insertions(+), 3 deletions(-)
>
> This is okay by me, but you forgot to document the file.
>
> thanks,

Hi Heikki,

I missed it.
Thanks!


Andrei
