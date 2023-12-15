Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CEB4776F
	for <chrome-platform@lists.linux.dev>; Fri, 15 Dec 2023 21:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H03npbNB"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5e4ecb50894so4158247b3.0
        for <chrome-platform@lists.linux.dev>; Fri, 15 Dec 2023 13:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702674135; x=1703278935; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MTDZCEFmSpT07ZfLz7vZkizeT1MqLax9S/t8QTl1d0Y=;
        b=H03npbNBypk0HP/mr3V6WGDysLQYQv7yAj2QGIKu6ggJGPPKESAE+t+vPAVz1puFew
         FltfHMPsJO+ajh+46I32vPbA6rKD9FANItD3SBcPTVTIhqSArky+ukFxYU7m7sVLKPhx
         vCgQc54HE/8Y96waSIjojFBvArfBbiQNTX0OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702674135; x=1703278935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTDZCEFmSpT07ZfLz7vZkizeT1MqLax9S/t8QTl1d0Y=;
        b=ouKnGLfbgcdETV5WJAVYqdqLTV1f4BWyAOi8xNmqcnYnZjVLjoHlblRjmiq2SM2t+n
         V+/NUfbuL8fKagOqQEaueE4KeylYjkhZk6WHB///5fsiTyGwyV+m1yVY+Df9RyfMSK2c
         pvrbmNvfBHkA1dBjbQvc/OFty3KYoebIUeCYYH3IR5h9N2M+3ipfdd99GKyKaPV8JGjP
         Alq9GJya5iLsRxiTDjGHgXHeQkQs5rW9W3eQRXsMuzv6mBSgij2cRwe+F+Vh1HdMgIN/
         WrFZ61yj1PZ4XCbgCkXWCDjSzrSDjMJdhdVWqlkiw1l0AIw4Y3OE9se/TKgUbC8GJ5Gn
         uLvQ==
X-Gm-Message-State: AOJu0YzZ3zqfm9JNjemJbDUFToHajDIenRU0ghGaQg7XEXJE4OG7Sj7j
	FhY8kMNbOJI964Iuz+E6x/uM5ow8KE8p/6CCmZLmBA==
X-Google-Smtp-Source: AGHT+IHG2yNMC71GN34CM/K6BzT74ojShGEa/vHULoEqCZj+Bn5WMfiAAqFWcB/K1Avy+6c5B8HyegKE+eg87hEaAPQ=
X-Received: by 2002:a0d:c482:0:b0:5d7:1941:2c3c with SMTP id
 g124-20020a0dc482000000b005d719412c3cmr8885843ywd.105.1702674135254; Fri, 15
 Dec 2023 13:02:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231213110009.v1.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
 <20231213110009.v1.6.Ieee574a0e94fbaae01fd6883ffe2ceeb98d7df28@changeid> <ZXpx9esFooSgq11q@google.com>
In-Reply-To: <ZXpx9esFooSgq11q@google.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Fri, 15 Dec 2023 14:02:04 -0700
Message-ID: <CANg-bXApLtwuk+B3=F4b0M_xJ06x6kn2Owbb0RC6Rdpcma4_Ow@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] platform/chrome: cros_ec: Use PM subsystem to
 manage wakeirq
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Bhanu Prakash Maiya <bhanumaiya@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Prashant Malani <pmalani@chromium.org>, Rob Barnes <robbarnes@google.com>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> It looks to me the patch combines multiple changes.  Please separate them into
> smaller pieces for reviewing easier.

Unfortunately, I don't see an easy way to break up this commit without
breaking EC wake functionality along the way.

> Another confusing about the patch subject: "6/6"?  Is it a series?  I don't
> see the cover letter.

Sorry about that! I'll make sure to add a cover letter and CC you on
the next series version.
