Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094192261D
	for <chrome-platform@lists.linux.dev>; Wed, 27 Mar 2024 03:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711510835; cv=none; b=RpPwj0uTj/1dbHDVUakaLULcmICz+HydPyHVGFeOB+qNdQX/nlsJlPcocG992/FHukNwEIUvQ4nKGv6OkTh1TUsvQHhsMslKQ4VPqOhXgjYZekFclNlabhVGH4Xub8OqqXTsNEEZbkl0bKHnNOkmdQ0tCjl2DifieQQVTqe3I1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711510835; c=relaxed/simple;
	bh=xd68Irl7FMjiKDIsBgFShbHmbskF4+/kOHVxexB+nws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/ShWgeEIPQVnAkpclVzd5uyg5oZ/zbQR5BIh8cf9vgsmsf0p9DHzsP/EslBBv4ngZcEoCZloHYYuLYXI4rYIzw3AtsbanPoE8nTbHuJOsWpbaV0YX7cQwic7G3Vn12PkdagfceB3MxMIDV+e9bbrnE5PUSSP8VE01Ma/whAPPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kGFIaeJU; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kGFIaeJU"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4765cffb446so2706128137.0
        for <chrome-platform@lists.linux.dev>; Tue, 26 Mar 2024 20:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711510833; x=1712115633; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xd68Irl7FMjiKDIsBgFShbHmbskF4+/kOHVxexB+nws=;
        b=kGFIaeJUNgnGorby29PejaanOlQE8snADvLN2T+x2w6swHcR7BAO3eDwfNK+Ea5MKI
         oG2TkZBRxTDT1Fvtwjhx6EE7JX4b2lFcoforCRSjKxVxCIJ0t6T9+p2Xgn30bXvTZGZV
         8lg63LxqnbJKst5qAaaKnjIn14U3exb5qQhaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711510833; x=1712115633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xd68Irl7FMjiKDIsBgFShbHmbskF4+/kOHVxexB+nws=;
        b=EG/QzEWToFsZ28MpVLmUEfh2hPQU2F1lvq+2l8OtlY8TYXBh4BSBwB4bQ9zXwg8Aly
         XlJ4xiaJl7L8wtuONBrytDCWBftkmEPaEhz8vvpeFDmCp1tEy0pahlT9hj2FEjfvr9yZ
         7hT9zxG6idmDgj088Yvm3ZccqpeRBOxSd67quVcjFNfIdYkr1xo5eNxVLmONZJbpNYpV
         DtiUaYp+k+xUvsEWUut+rYvD2IDYgWkycj5q2B2ubCGSDchfcuvysume0eDG8wD+MzkU
         7r17Ai6HbpHO56HVxudjXq1pXKSB/LA2spVs8K6CD8FuU3teSgaXXuNgHeTRRE5h6miJ
         xXUg==
X-Forwarded-Encrypted: i=1; AJvYcCU0QR26YD+Gvy3cpwc1va0di7LTA3lbvDilzdVRE/Tc8UR7ZFse97nISUoL0Joq1CNk5fUGPy3r/+fPSagtQ7F3rDSQxK33Z5ojFh9/DMx4
X-Gm-Message-State: AOJu0Ywd4RtCB8EcnbiGgj9AZ23DFEGos1yszMGuAVM5NEqBasrFJbup
	FVzwFGFnj4lYdrlsyPUJbCrFXTlZAUosFMqM+7jnlncRQmyq/UC/MCdBiy9ggJ7XazH0t+r9hJS
	Cysatx7Nl9tNp4484DarmgcZw7HU3UUYQ2iHQ
X-Google-Smtp-Source: AGHT+IHGCiSeNt+YDldU30wn4bEUUkwnwRNEFj9Oa4heTmCMtNShSI/XEU8q4wWwhvcP+br+a93tjCv/SBIw00jIxIU=
X-Received: by 2002:a05:6102:510c:b0:476:db9b:c60e with SMTP id
 bm12-20020a056102510c00b00476db9bc60emr3593266vsb.24.1711510832875; Tue, 26
 Mar 2024 20:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
 <20240325-public-ucsi-h-v2-3-a6d716968bb1@chromium.org> <62b2c29f-ca1a-4131-910b-7b9b62a5577e@kernel.org>
In-Reply-To: <62b2c29f-ca1a-4131-910b-7b9b62a5577e@kernel.org>
From: Pavan Holla <pholla@chromium.org>
Date: Tue, 26 Mar 2024 20:39:57 -0700
Message-ID: <CAB2FV=7fqsdDuuxZb4dte+Nm4-Pijk20hGzbT8uvzQKsAfup3g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/chrome: cros_ec_ucsi: Implement UCSI PDC driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for the review.

On Tue, Mar 26, 2024 at 1:47=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Nothing improved.

Yes. I only added maintainers of drivers/platform/chrome in v2. I am
still investigating why MODULE_ALIAS() is required.

> One patchset per 24h. Allow people to actually review your code.

Thanks for letting me know. I will throttle future patch uploads.

Best regards,
Pavan
