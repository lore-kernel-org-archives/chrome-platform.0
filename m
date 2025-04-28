Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF49C213245
	for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 23:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745884531; cv=none; b=jcedoaZWWEhf32ET1DssMKqxRApOBXHeHxrNOlr8TdLeMdDH4H1mnEGBBQk4jo35MPEkuRTUjtiS59O3ejLu7AJO/cf9q1gPKHbtxW3ZbUjV2rh1vva3GcEC0VPYbQfY0MOQzhheRNyJ48krVMfNM9P/obpJg0yKiPmerSsu5l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745884531; c=relaxed/simple;
	bh=LJobFLI9bUS7cIOXH6lW9QHErDLL0/CVqlV/7NhJ0Ck=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7uPh7wAGBeurBN++jssL0geNJfZSDGnKiP6AxqZA0xD5WC8AIn5Ull8efUoUTfp5ulEgDrwfWp9iJdpEYOFxXpk4mdGXyKQ8a1/ykQy1Un+uuiHSeFCd0RWNGwDHPUyBB1qEA0X1cmRuULzV3MIO7kIiXvIE1n4PbqprDKdcWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KRvHIOtv; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KRvHIOtv"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c922169051so292018485a.0
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 16:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745884528; x=1746489328; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJobFLI9bUS7cIOXH6lW9QHErDLL0/CVqlV/7NhJ0Ck=;
        b=KRvHIOtvM7BCa8CU3Z2H3bEH6i56T4MeABLvOJsxbfaQ9lK6jtemKAZE6GkY2WnbZp
         jF30pFfuLHna2YQNX7cyiufPxGa12De8PVAXv8ffFaPV5KNHy80JJfN1lcnzXAvi7IxY
         DSWIgw9V72En9thwp5GQVuRxDdoFSXVuwgyOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745884528; x=1746489328;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJobFLI9bUS7cIOXH6lW9QHErDLL0/CVqlV/7NhJ0Ck=;
        b=rcqh5MIWTBkZeKy/jRfsGhfSu/cjqlYP3/WsAYuShoCrz+Q+2UYJMWKVSrH0cgfnj8
         Wq+cweA6vCV5JP0qvhsSWoweNyB3BkOuZMn2/+TE5nZbCBcPSGmbFdVqsBaRBocFi2d+
         TOLsmYwmKcEXHIWVU9BDU6sNmO8fsp3pVAnYt/MsWbcaAT8bCkyQtEwHvNTkeE8ndu2v
         zMzl552IdKVsUrWsawOdpvNW0OMWNyu/eUurmWCZb4KNGkoQ6HZGm7Re4UGLkuIrP/2D
         BO2sRhygCsJDLEqtYYCJxzgpUNKxizLoeoTg95XUhPSiVpz4FvgxSIMCBL8+Utl2hkHP
         z4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzgMDufrNI44lPD0rd+LCn2Rkx8bM8Do9eRtZ+rln/jGpwefbI4xf4s/4hS5Cwqa49XClTgpM/fS1rRcmsHHE=@lists.linux.dev
X-Gm-Message-State: AOJu0YytXe5AOooVbSYdzxhC6BEiCT1KwxLYaJ6NlRpalHBBsH7Cb8q8
	ZZnpUgC9Pr4Gq7BwNuM9RfNDtzrRfMqlIKLfVaZJIGw2KonIevtqfnn7ZRpLV5Hbpb6dVaCxsgT
	zf8uaMNBrbi39lpSdKJHSrVrHfQcw3yE5eJpM
X-Gm-Gg: ASbGnct73a4kB7JVHXPUW2zCC3la06I/sM3ucc1ULZL+1o+M8Bl+Pp1LG3vT+A8TbOO
	m9BjIJbeZHU/ZZcv6dgV8hnoQZL0TcUz8JO68HS+oo90PhjcrWOo2uCE40vVbtVuUiv0Fv9EQ/j
	5nZegZ0wOm1prgYJJJOcLitDl1Z2uXRlOWPOVxSTEWsTCpLpj62hfrjXDyBXnh
X-Google-Smtp-Source: AGHT+IEoQ9Mtpgq6IV7o2myPZsE3iTvANfEmqsxJiZUsKgJmcwAzipipK3XToxVL1xycDMjbiz/L+FlGLzhvF5FKt7E=
X-Received: by 2002:a05:620a:2610:b0:7c5:5e5b:2fdb with SMTP id
 af79cd13be357-7cabddaf1cfmr245880985a.41.1745884528355; Mon, 28 Apr 2025
 16:55:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:55:27 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:55:27 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6eeb7bca-6018-46de-a7db-7189d60c0942@oss.qualcomm.com>
References: <20250416000208.3568635-1-swboyd@chromium.org> <20250416000208.3568635-2-swboyd@chromium.org>
 <6eeb7bca-6018-46de-a7db-7189d60c0942@oss.qualcomm.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Mon, 28 Apr 2025 16:55:27 -0700
X-Gm-Features: ATxdqUHpAwR2wd_47EUgCGBgUk1wdQDezy5iMkujDq5bA3ST_h6HrhmS7YUoEN4
Message-ID: <CAE-0n53ypGBXAt3frrbfAsbJZEkxK4BCB0+3MWOFRxZ9E+6P9Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] platform/chrome: cros_ec_typec: No pending status
 means attention
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	Pin-yen Lin <treapking@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Jameson Thies <jthies@google.com>, Andrei Kuchynski <akuchynski@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2025-04-22 06:38:17)
> On 16/04/2025 03:02, Stephen Boyd wrote:
> > If we aren't expecting a status update when
> > cros_typec_displayport_status_update() is called then we're handling an
> > attention message, like HPD high/low or IRQ. Call
> > typec_altmode_attention() in this case so that HPD signaling works in
> > the DP altmode driver.
>
> Fixes?

I didn't put a fixes because it only matters to make the displayport
altmode driver work with the typec port which isn't used so far on DT
platforms. I view it as a new feature, not a fix for an existing
feature, because we don't use the altmode driver.

It also seems like it was intentional on ACPI systems to only handle
mode entry/exit and not HPD signaling per my reading of the mailing
list.
