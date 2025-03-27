Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F61F3FC2
	for <chrome-platform@lists.linux.dev>; Thu, 27 Mar 2025 07:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743060188; cv=none; b=B8wpAjJwlWeVrLheKc1AR3ItoMe439/Lj9Bjl/O+B/IBOvTZBTngvoUDX+XDW64fUvsN5XLX8JTt7FL+8APltNSoqbWg/c3ZrE0eZXYpaTERS1VGVVK2ReyfROPE97FNmQKFbDWrO7r4Kq0fraBN8mIaLYbAXl7OD/xiTB2Xd1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743060188; c=relaxed/simple;
	bh=N9SMOd1thOD5auMiNd2nLvxsn7PA2OVj34IXN8Dpmfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4kzrmxRMqLuXQsdBX2pMuzWzvf0Vv2BrsjLIIV7x+aduqKndydViHp47ssXH/boOB71+1Y3ncz86Sr+A/yGk4YtWVU6dPnk2Mw+02d+MI69nnJ/z+TBmfwwwfjbUiNUP6JbU8eIbeGn6ZVAytvKrcPRAy5MkcRhf1ckXtVMIPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZOGP8L+I; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZOGP8L+I"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d64e6c83eso686255e9.0
        for <chrome-platform@lists.linux.dev>; Thu, 27 Mar 2025 00:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743060184; x=1743664984; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/Y59y/fYXI/MIDZveqdd+FFwrRU+OYf9xm8AEwmjAE=;
        b=ZOGP8L+IanmcbCZXlXCS1PzVEswbuU8DUL1ppCcC4FYvS4OrHK1hjiAmU5rf0NOBwS
         n9qO6pC47nXCs8b/ZlacDxE1Dr6yzofPXr3vS3P1sduei1QkPeJumdx/vIZz/BGmBbxA
         aSRwoOrwIIvXPp0yiUCczqIP9UtPgzw3PqKEL5iY7lryXW/UjGAxUvcjfrUXj3T3d9ab
         bdQ5LuFqXFmlXPC4/W/B/CmHhg315t0vMk2/ttoPZqfB8na47Um2uJFzii5ZzhOEvWRH
         gPnoqZQ44j+7oeH2f6fsVkvmgIzTdiz+211Es97I6Xck0wKUyUQDzZoI71Lc82DncQ7o
         T3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743060184; x=1743664984;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/Y59y/fYXI/MIDZveqdd+FFwrRU+OYf9xm8AEwmjAE=;
        b=eneMY/Oqvb+Wehsxg3vms2TJLfq+VMsuXvb24OTmGP2FG2f/5zJQHSuSp/HzsI7SQx
         rP4BitTiuAj9JIDp2IM3539FEJNHS32er6UvWIenj9wmDe/20DEJTi7iwiOmqX/20zlo
         kctLcjjZtUS0bzeFS/FlFJWlR2YQzXfeA05ozEHAELirGTWYbZPQYcBF9EOetrxw0e+W
         fmrHQ52XGdsGBXIAwk0/iINfcYfQjrX9cpFtmSlJY3S+EnMd/SyLYDNurQ4MiEk4sq0s
         0xGqkJUvYaMSNAM0JrfUWaclVNpU3KWIMTS3FqfG4eIzJK/ZXXBIjp2tHQyUzKWfC44o
         LVVg==
X-Forwarded-Encrypted: i=1; AJvYcCWaM6KuCPDHrf1EBQlNDHLffxoEauboah5uN6Pp7Bbxsb7Il74Rllue4IUly9j8UAF97pDQsyUEVFl874pOdwg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8oAGFbmVl/XhIMECZPbrhpfzPVU8inv7PE8pc0sEOkh+xCIrB
	n7buRnLAukaZoaYxZdb+MwFNhr1TmWikCszQJtquPFLAgWKLbBCs8ag7XMnZExU=
X-Gm-Gg: ASbGnctuEBYNLAFUKd/JJYROFQ/6275E5T5vGYqihrDMqq279mDj+UTSMy+wje0yUmi
	3gc2CnVkUJPZtCOQFC+rV5tsJqE5pwDnXjBrzjtm4n5x03o4CxAZTSkug7p8jZ/6+qyeSMtAnw1
	cp2+eMZn6fBk72q+/qxghBV5LkwsczvhELdcHgbfUkIt7GvCkb+00qstrvcA75y2BIELuffhsOy
	qvlCduxqr/whz8R0pray/pW1I+6AKYpkrPjeB22YKC4/EIdQtguz05XfM/UN1lvpt6TQbIpM9Bg
	n6Igq73b0Z135rCtRzlN0bM5MlAPgCw0C7m8llDCeBZfntYAO/reoPYoL2CRX8M=
X-Google-Smtp-Source: AGHT+IFWaINuXHKUMdyo5RP37K8zDQ0bWgCSEpHcoB9XhhgozZBQGKZ3w4EmQfkOaefijiS9p7CwZg==
X-Received: by 2002:a5d:5849:0:b0:38b:eb86:694c with SMTP id ffacd0b85a97d-39ad2aaef54mr446469f8f.0.1743060184101;
        Thu, 27 Mar 2025 00:23:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9957c3sm19517639f8f.18.2025.03.27.00.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 00:23:03 -0700 (PDT)
Message-ID: <5549a95e-938b-4560-9e60-146e5e0883c4@linaro.org>
Date: Thu, 27 Mar 2025 08:23:01 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] UPSTREAM: media: platform: cros-ec: Add Moxie to the
 match table
To: Ken Lin <kenlin5@quanta.corp-partner.google.com>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Benson Leung <bleung@chromium.org>, groeck@chromium.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-media@vger.kernel.org
References: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 03:39, Ken Lin wrote:
> The Google Moxie device uses the same approach as the Google Brask
> which enables the HDMI CEC via the cros-ec-cec driver.
> 
>            Hans Verkuil <hverkuil-cisco@xs4all.nl>,
>            Mauro Carvalho Chehab <mchehab@kernel.org>,
>            Reka Norman <rekanorman@chromium.org>,
>            Stefan Adolfsson <sadolfsson@chromium.org>,
No clue what's that... and I don't get why you call it upstream. Follow
standard upstreaming processes and guides.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

If this is for your own projects, then obviously NAK.

Best regards,
Krzysztof
