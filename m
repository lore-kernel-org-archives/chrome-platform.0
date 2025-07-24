Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF53D274B46
	for <chrome-platform@lists.linux.dev>; Thu, 24 Jul 2025 08:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346354; cv=none; b=h4RlyICPEQOtKoGgh4gLMTKqDtTCitNg/hpQaCVloemz99VZHufiOzcmWli8MluC/w9qMnztZ0d8YNU6MJ14yCX6Gf8PFmOqgTMUxMX6hFf4AHd9GZ2/59gGFghYvrwDt90nwKSE2b1ie2liCq05i/Z823Y9JytttzB3JsCZuzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346354; c=relaxed/simple;
	bh=DPnU95ZJtHDimTEnJ4WU3skY6t7lEUuN/QC7PlHSgdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KR9Ionrs9UBTbVr+MCiZWUYYBEF510CHApE8GA9IPStIa/6+TvDiYBPK18JwsgKVJJFSPROVemd7V3xThInoCZTij2rFcsrzFpSNwPJglc3+oUkMX1LMQ+/qPYXuOT+04+TdQfME9D+v6UHRRA+qd/pdMnNR4YOTAB08UbZAPYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EIC4Oxy0; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EIC4Oxy0"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b31d489a76dso846590a12.1
        for <chrome-platform@lists.linux.dev>; Thu, 24 Jul 2025 01:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753346352; x=1753951152; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X0HMsTBmbQ4+9APSf+6vM24W99brsJT2SqN+LugoyEE=;
        b=EIC4Oxy0IagbRn/2ju4CBDqwSIkbRALhszGtBdOIdcuxbPN22wfRrApI45+XygXhD1
         iwJ2+vwrJT0lWyHeU5FXHW5Xp8MV5jcT3LQTF//X7JAqlyDbNk92hc2rUiTZlpQjuMDh
         WzMlkBHESaudMkZORPcFaTTIwFosVfxGSBhDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753346352; x=1753951152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0HMsTBmbQ4+9APSf+6vM24W99brsJT2SqN+LugoyEE=;
        b=dFXFeWJw4gJQVLmJlh/icy1aJESoxVUAY6Lv5EJ8ZA2GWMJJn6MW5Ir+ODlOQayGVl
         8/bUbm/1sy9vMoLeA8qxoQ73sD9a1dybOi7gWUZirFxiXOQu1iBoEBKWg5e4Zbj5E457
         0XFH3t2IzWqzqxlvW977kVCFeVd+OUwBDP8WEKd5aBuLcZNyEz4Z7vmHjRce9v9ZGVB9
         yf19BzNTgS5LN6TA5pCbmjFZAjV150rzpL6Nnlt71glgwd5s5fzo4W7EGtJp+g6fvynj
         1iwFqQJjsWAv0BANe7rZpnzp4PIJpU9fXtFwbwTIYaA6iQ8IlJPQs9+Mb4VXd690JQLa
         lnLA==
X-Forwarded-Encrypted: i=1; AJvYcCUb1zub5NA7GGrZvJcZRDgfyEpJ5GGz/SFD1C5BhPh8l3Y2kOD+JM4xR2zn6ADQyuNTR4p8to7TmnwNgdITQw8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCV7vaC/ORTgYyoUtpqcUVHicLIrea8oolgiwJyr4FjzDa4NW0
	ivvKj2ZY+Kx0VofUbbu/rh412CUBpcWSE9TAQkN2EaftXGhTpW+Hx3Yb/XH9vHMcTNnLgtkLC1E
	xU6/JtSTJbp7n7oUB9HaKjr/+VrQ0grr+OZfUlvBU
X-Gm-Gg: ASbGnctYacZCmlXrKrTuRDtu1Q5jyIDIiq7j2BBRRsdgCH8f3WgddskYfpbrkjNB5ev
	jmm4iVUxlCjS57LdAK7E9/YZ14mF7Z0aPQyG/rUE8M7KL28byBG7Cvaz3gADFtQgLdKq2HSvHNM
	dUIGyqqFTb2q69zL/kBmPZ3XGTXJVAvv1sBKOJHzUAzoFqwv8K6NfLPfG3MN79jPu9/FVP0hxV4
	EAjksRPnUVISUEnynsjGmXiCiy+LQWxPQ==
X-Google-Smtp-Source: AGHT+IF6GlHoPfQBE7VcJ/+n3gkrTpAcXrzNcm2cizHwNSOzKAmihYyhhHBa69uI0PTyutNd71gW6mxdz1twf+0MKAQ=
X-Received: by 2002:a17:90b:6cb:b0:313:1a8c:c2d3 with SMTP id
 98e67ed59e1d1-31e508172ebmr7030678a91.22.1753346352248; Thu, 24 Jul 2025
 01:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250630141239.3174390-1-akuchynski@chromium.org>
 <20250630141239.3174390-6-akuchynski@chromium.org> <2025070143-safeness-prewashed-6e9f@gregkh>
 <CAMMMRMeKyi56Pha-X86BaQwcHGCx-xu5F67HCGZg=Yhxuk==OQ@mail.gmail.com>
In-Reply-To: <CAMMMRMeKyi56Pha-X86BaQwcHGCx-xu5F67HCGZg=Yhxuk==OQ@mail.gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 24 Jul 2025 10:39:00 +0200
X-Gm-Features: Ac12FXzobt46uNoTI8Mrqq6Cj9erlIAHq47itWaRXovYE0fFMCg2hJa92bbZ6uk
Message-ID: <CAMMMRMf_qc342=azkU-ceg=f-db2Z9NiONOu1_oRk8tmRL4RGg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] usb: typec: Implement automated mode selection
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, "Christian A. Ehrhardt" <lk@c--e.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Proposed sysfs entries for V3:

- portN/portN.M/priority, RW.
This attribute assigns a unique priority to each mode. If a user
attempts to input a value that is already in use, the existing mode at
that priority will have its priority incremented by one to accommodate
the new input. Users cannot disable a mode via this entry; disabling
is handled by `active` for altmodes and `usb_capability` for USB4 mode

- portN/mode_priorities, RO.
Provides a prioritized list of all available modes for the port,
formatted as a space-separated string (e.g., "USB4 TBT DP").

- portN-partner/mode_selection, RW.
Write: 1/0 to trigger or cancel mode selection.
Read:  Provides a prioritized list of all available modes for the
partner. Modes currently in progress are indicated by parentheses
(e.g., "USB4 (TBT) DP"). Active modes are enclosed in brackets
(e.g., "USB4 [TBT] DP").

- portN-partner.M/entry_result, RO.
Represents a mode state for this altmode, e.g. "none", "active",
"in progress", "cable error", "timeout".

- portN/usb4_priority, RW.
- portN-partner/usb4_entry_result, RO.
USB4 mode, not being part of `typec_altmode_group`, introduces
additional attributes with the same meaning as alternate modes
attributes.

Please let me know if you have any questions, require further
clarification on these proposed sysfs entries, or have objections to
them.

Thanks,
Andrei
