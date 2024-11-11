Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950B82AF1C
	for <chrome-platform@lists.linux.dev>; Mon, 11 Nov 2024 17:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731344499; cv=none; b=RiL3D67S57mO39iT9XUTy4qR1oBgi3WV3zVTETfsAgK8ep9TOVslIsKOyl2GxeRONRMZrggvYCSUpvGTw2pAEST6JgtSlUBDV4qUH71EMgOvc8VUV2HZSoUip5+L+odPb9V6A3VmRKPWK9qINup939A/S0o3o68kqxyp8n1KosU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731344499; c=relaxed/simple;
	bh=A2lree05lhP2BVEJJz9opyAsVJDZkDnU/yzyEvyMeLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWdmUlEc/Wy+ns6TATThjD3w0ttHVthsDglZLyFvnCZ+ETOSVhjrAW/XRYFL2N6H+veqemeTcEYdy6OiMh5gn2CKkOzYMAI2OW5tOc8yW3j63K0VaRNjeJUbE3obV6mv3K2+aJxDj5TcAkNKKlYBnMgT/zE7q1neCSQHFw1xHso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHV8Yk8j; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHV8Yk8j"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2110a622d76so41714285ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 11 Nov 2024 09:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731344497; x=1731949297; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7BrwqXg2K04ISgRRSvgc68hSMoJZDYqtMi3Rz8EonyI=;
        b=fHV8Yk8j1vqqrKaPXJQDtD84IduUjziSUxkBWZhMJI44fQymqu0RsG8v8QwWEQciHn
         T1EMbZBaOei+j4DL4HhyPCbzCF5f3dM2ATykP8HgKNtwmqLDG+CsMcmc6JVlipecbOgG
         SAL7VG/bJkX56Qd/SG6ImlAL4rLtVMo0tTJjXCqr6sYuWqVeEf9UnVNdIbZh+PWMSaMv
         JbmDxVVoSVvQmgrS7QLGxUnLGi2Y+KRGRdAr5GHVszAbrAWgsvL+ZU6yyQarXFxPYEgx
         XPmeAbXUOIwpIzV6s2450EeUhzSp7RAKF/VIPcgMSolTT6OP+j+caWuUSBDWtmv8fuY/
         Iagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731344497; x=1731949297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BrwqXg2K04ISgRRSvgc68hSMoJZDYqtMi3Rz8EonyI=;
        b=ORbgMT1kYG7IsdzlNhMMM/EYaDtxgfKd/qlM8sikbDWI+rBamlze4NeXlDeCmH7JHF
         OJtPBb6QCcz0Xty7eNbYUJ+Z4DJLSIjbGsP77XbTMVHSqi2gUaU8m7N48UwwmdfCBuZr
         KZoWYtcaIcHo3onv+vshZUxjx5SoP/O2OWxozMP6wRlm2WD2iUVA42D2f3agF634LQ92
         fjISIgkEsdgL3Ugrg42IYkYCTwouT4f1bHc8rtV/zt0MpxPxwBZ/gzmGicswzwO9RQ0R
         ag58hLL45vXXKxp+FCNCyVPWTSsBU7y0zkX5P/9WJ1aFHPiEk5f/dfGXd4fIFntRl/sg
         z09A==
X-Forwarded-Encrypted: i=1; AJvYcCXDBH9sqc3RhgsoB7jDF3pGN6oPvSf8NaPMqjX6/WvcQwRmeDW8oo93a+deqEmRF6S0kajM60tX+0SwxJMDqhU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXXi++mUvx2g0G7Y8FceH2yAlmd3hG/PcpM5pn/kpqsHvUxaBu
	iaSJCcswK5EadZUaZMd25M5lcVtw8KgLLkguPZUyJxJtkvtmFFE9
X-Google-Smtp-Source: AGHT+IH288DjOak8kq1cJaGnfwAOh3FKZtPfUtERt3b3efj2Du1GHHyM22Ad4rZmh3Q9qYIzRa1LyQ==
X-Received: by 2002:a17:903:189:b0:20c:774b:5ae5 with SMTP id d9443c01a7336-21183c43bc2mr165513625ad.9.1731344496663;
        Mon, 11 Nov 2024 09:01:36 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fee67fsm8731751a91.49.2024.11.11.09.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 09:01:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4cb3b1c7-86fa-4344-a413-031723f31f1d@roeck-us.net>
Date: Mon, 11 Nov 2024 09:01:33 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (cros_ec) register thermal sensors to thermal
 framework
To: Sung-Chi <lschyi@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <thomas@weissschuh.net>, Jean Delvare <jdelvare@suse.com>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20241111074904.1059268-1-lschyi@chromium.org>
 <20241111095045.1218986-1-lschyi@chromium.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241111095045.1218986-1-lschyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/24 01:50, Sung-Chi wrote:
> From: "Sung-Chi, Li" <lschyi@chromium.org>
> 
> cros_ec hwmon driver probes available thermal sensors when probing the
> driver.  Register these thermal sensors to the thermal framework, such
> that thermal framework can adopt these sensors as well.
> 
> To make cros_ec registrable to thermal framework, the cros_ec dts need
> the corresponding changes:
> 
> &cros_ec {
> 	#thermal-sensor-cells = <1>;
> };
> 
> Change-Id: I29b638427c715cb44391496881fc61ad53abccaf

Drop.

> Signed-off-by: Sung-Chi, Li <lschyi@chromium.org>

Detailed explanation will be needed: Why not use HWMON_C_REGISTER_TZ ?
Unless I am missing something, this code just duplicates code from the hwmon core.

Please do not send follow-up patch series as response to previous ones.

Guenter

