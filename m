Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFAB2A1C7
	for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994309; cv=none; b=SJ3ZpOs/dMxW3/M9tP3ZTxma0Bu/mCRPvR7cW5fHEeraOek2DS0Z6NOXxYYfgDCXVck2+SBqOllpEAp6PrGiAG9ZD0ihyz36z6tmvu3s8YxtAtse9H9bMkZkoa583b83HCsiOYkenh0tt0GFht5xrGgeBJ/XCTYc8+5gvQFBLs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994309; c=relaxed/simple;
	bh=eO07VQEwgqSfynp1qqdufNtqE/l1gHcgbWWeB+OT45I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7hVpLhUVL3AeHypL/mzCDR2VoZyNMNTviLtDxvza4BLYc1sIvj5ksmCUz+OF6ybZUHgrKolB1jQ/qWNN44idhW+exvk1lTNmW29IljDpJlG/vviqr6N9mjQtCnbc5SWoT6UR8B03oyvFQa8ZCaHV8zaj1LygM8F6pn8Ao2XtkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dUT+N9nI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dUT+N9nI"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b31507ed8so3717425f8f.1
        for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 06:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763994306; x=1764599106; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae8T0Z9s4xBOOpN+XeFPZD9BWqfqP1d4jFrRORxUC1o=;
        b=dUT+N9nIvgWKQkabNErsD6cowUVmbTr1MqmSZJx+/Spp0HJ53LdnKk1x3lCI3Uaoaw
         zk05Eq3uoR/26RrrXZkA2c1N6L8FDIMMCeYLzka6j4TvSW6fL0Vs1R8ZdkvENNiRSvmL
         R/v8L+0jFo+DeyYrWLb1h0lvKfmdKj1cD0o8dSNizzIJCCw3i1goM3dm36BAPMPQAZBe
         XbEDsNE0w/7sAl7RXUE1EBbn36HZqBUVFjlQbAbHf3RPsh9kD/VlI/3wZDkfutawhIlF
         vo0hfjX/SfWuydzmNldbSdG/ndYyhTfm7x9T8Ym80CTBRMPHTDY4NMYNW7vis+HAI4XZ
         3dIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994306; x=1764599106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae8T0Z9s4xBOOpN+XeFPZD9BWqfqP1d4jFrRORxUC1o=;
        b=We+gxvA0s9gXf+Two5S9gJBL4hjMRJFsuQ0nzs6EmCcybXRDdT/Jk/GGVMmpYd3TNM
         OSGOS16PV9lp6i4NH/Wd3ifMAnlDU7GmSx0ojoJonn2ZH+7G25ngg4FjofMU2yZmb+Xa
         9KeR+7V5AgAIzE8DVBXWe1Q73PnmP0ZNv+EacIA0Bjvy3Lo0EaUdODbj9pX8ys6zeF2R
         hWk3FOpnA395c5DJnOY3+qctiLTcr8NTGep+HofpKefWoWQbafSyUXSVsO4eycCqq73Y
         SIwFxg6hnOC1JyyO+b49cyY8nimZqzMzS2HmqwvEYg3JGA4/fyXfjoTxUnHMr7XLwQIN
         6yoA==
X-Forwarded-Encrypted: i=1; AJvYcCWc95gdqJD1mM64PiTNuZGrc9PPhmwkQ738PB/txhByNthbfEk4ty79JBgOTX/s1rOY82i9zHPNdLmSZHfZI2g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhwzswJ7Nx+ZBUiP3kqlxu4KcTvpG+Oh1F5YxGV4zZ4omMghyn
	wMkYsS1qCfa4Kbncr5DfzvYg34t88tNm2/c/9MsP55foN80icum6RhI72rxKm+TnTec=
X-Gm-Gg: ASbGncvS43JSxEdlgi/DJG9oVRY1qV0m82PVkBibMmmOaU2/qhlg54xSlsOUFi7I+gv
	hn4ps9IQlZM3ZYCRoRfoIBK7IlV0kaKWEUmaRbHG2et4GGvkvXFMabX9ZqYoFBftme2p6/9gSty
	tREe/o1Woi6yGllv3mhU5Zw981F0/jSP6GxcjSVTZnspqkkPTJ+M1G6zZJSOKMzzyanrgSxoEvp
	TU9HQsGCKv6/LvVaGaRkttGgPb9dIM7+QTnKP4Eyb5o057MkJf82X+oVZtBCQx8bJjajPgB5y0k
	a6jhoxe/eSyVELbyXgurj0goQU17fYRbuBj3jNsIhuGg5g+y0u4gMeEn0pWaxy5bziBJo3TWhV8
	abMbBuUCts2oPdaEAARd+0apsnEQ+x7J761q1PhiYLGGSVwIR7SKvpFxRrjWMnrLZSF6Ep1GpF0
	qkzGB7kBE=
X-Google-Smtp-Source: AGHT+IECxhv9+1ZGZEYdbHolWeNHq8FMXodd47D6FbZd+PU/x7ZCehXLWBv/uH8jYsOdYwVYwArfyw==
X-Received: by 2002:a5d:5e01:0:b0:425:742e:7823 with SMTP id ffacd0b85a97d-42cc1ac9401mr13013463f8f.12.1763994305318;
        Mon, 24 Nov 2025 06:25:05 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa35c2sm27493166f8f.25.2025.11.24.06.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 06:25:04 -0800 (PST)
Date: Mon, 24 Nov 2025 16:25:02 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	"Christian A. Ehrhardt" <lk@c--e.de>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] usb: typec: Expose alternate mode priority via
 sysfs
Message-ID: <h2e7a3xkss5zkjuk4jtuadx7uudt3rl6xssbmz7tgagw7idbhm@jnv2idvv3hbf>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
 <20251124124639.1101335-5-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124124639.1101335-5-akuchynski@chromium.org>

On 25-11-24 12:46:39, Andrei Kuchynski wrote:
> This patch introduces a priority sysfs attribute to the USB Type-C

Please read submitting patches doc. No "This patch ..." stuff.

The rest of the patch looks OK.

> alternate mode port interface. This new attribute allows user-space to
> configure the numeric priority of alternate modes managing their preferred
> order of operation. If a new priority value conflicts with an existing
> mode's priority, the priorities of the conflicting mode and all subsequent
> modes are automatically incremented to ensure uniqueness.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

