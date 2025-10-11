Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551F6323E
	for <chrome-platform@lists.linux.dev>; Sat, 11 Oct 2025 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760141429; cv=none; b=OE070fnnryqB1bWFVfi7UsONDUnV4UX4sawjqJZvGdP5D/rOrrZ2uwvFZVdDWb1taoRbJV8CTsuBdL7stfnloiZqnqMvnLyUYQXdHMDZn9ummOimYGX4TnJwJ0mmLCP2yjnHLgwhiSLwwnh8mCkwN5qVlO6MQrpsnrEhMWfQBrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760141429; c=relaxed/simple;
	bh=vhsuxk96WAH/RhC3vemDEb946RpngHOAqABSwAfzGbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTjgQ37BDCYA2V6armN59YNVKACZgJhUoVHb9M9M0Lyp0Rxm4VnuJ7POA7syFDhA/esSwWntTEoyp9Ux46ULLWCcmYbisfbXANcZLpe7XP4NUlNXPqbr6Qxk+HDuV/HubRa0dOvwM10bL0DXHAVEtxX2HrM1rV6LtkbEIEqbBTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IRvCCDdM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IRvCCDdM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3f44000626bso1775805f8f.3
        for <chrome-platform@lists.linux.dev>; Fri, 10 Oct 2025 17:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760141427; x=1760746227; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vhsuxk96WAH/RhC3vemDEb946RpngHOAqABSwAfzGbw=;
        b=IRvCCDdMa8i9I3sDD1vdREvpGzqPfUNuR007EyUNVWGkkDAvyZkkH2VBg84jonvy4d
         iUrYS+8WB8jR00X5n92t0NXwSBHbqihzHC+Sy8Yl287NrManPaWYkegwhQE8nR7PNV3l
         9EcJlgxSTZ4d2GKDgo/aT3UvJRKRZcGxF78hxof9B40dIAq7rB8OoIPXU4sSLFE/tMcI
         PTSqt9LhrLN/55LkCJkugPObTHJNFI74uMo7c+jo3idcXdoenrrHMOMCfSS2AvYbVLmM
         g8jzoqvADVA3GWm8tcHBMQeYmW58W8vSVxZjiLQEWm1HLcavrXQTTFjnWC8ez4CJzxW6
         mEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760141427; x=1760746227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhsuxk96WAH/RhC3vemDEb946RpngHOAqABSwAfzGbw=;
        b=Vm7ttt/jwWdgThoV4iYfjjcpjkdf2+m3LJ/rz8i/fXQ96x97hdd2f+FEPO9XzA/gkl
         Q7ErXk8gK8McdWMSM3WSDH0UpPdF01SiRLVeGgauI5wEHN4Ss1J0kkCO4yWW30/2kITO
         bg1ndbhvnKIpw1V+grVK/1GijyrdiOnoVI4NmxwUkQkjmhSV1FV4mZLAsZBYyjcl+JiO
         Q31HsndW3m8e6PKl4nlR58tiQq932q6VlDnMSBltpjt5VxeUsnDnJYUCmyimreP3zSvX
         DZWoR4nHCc8rCr5mFXc9KUSdp1whjDmpO73bqUbEJNvKE5uw+6iqrbbH15xmV7e3cbr7
         H4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVp2PE8OJDHEko4STPnRtvFAOlwqJNjSLPHvhRo07IICAFm8tHaogiZXEHMcQ75XEyKrESkkWO/FkSZ+QkIKM0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNTT5vkMzQ5eZCj3F1gCF6ecmyffvTaD6qEM+6WYvu5/jym8QJ
	WeTrMzd50fOHjvrii/RuGIAab9SF3SpDNijZCaxJq3hSuzgGqMTqvUUWL7637gV2g7q6NdFa9Ki
	Izbe4TLk6mW49kk33jP+etK79WKbNbbKnDtlBEcy0
X-Gm-Gg: ASbGnctuTAjgogYC72kP+EnYBJzFjD3XRU9rDZyZ7MDBibXyIawIslbCHts02F4IM+S
	wKgxwsu+xwrhRjjP+G/2JHJCUkEKX1sToIi431mVvhmgW8PgVLBc1YuQ9sSXSiSuI+rhDh9wuKx
	lxSiJNOZeA4FjyEzug9Qtw6k0aTRzCOYeDKoDd1m0bhHAy54eFPugKWV0rb1jnbFmoeGH6JdRwK
	VaAc/1m/UA3f5OACf38LA+TNLYaX6gKjvWMOZ+h6HhNUbX5T1ISKtL+34VwMFgUnMgnq/LS/bI2
	PzsP9L5T
X-Google-Smtp-Source: AGHT+IE+ZGXJMaXhPli5PfF8e59JjiGHyX8ap1P7iYMH4TowQfmU4UEUloQ42CoLYo3lvX2UUV72pFmKUq2N6vrDDqY=
X-Received: by 2002:a05:6000:290d:b0:405:ed47:b22b with SMTP id
 ffacd0b85a97d-42666abb50fmr7632735f8f.10.1760141426475; Fri, 10 Oct 2025
 17:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251009010312.2203812-1-jthies@google.com> <20251009010312.2203812-3-jthies@google.com>
 <alnlmxbcv3ivhh7iolfqsurhknnm2o6i6waxq7kuhmzcbeljr5@a4wy3prshu3c>
In-Reply-To: <alnlmxbcv3ivhh7iolfqsurhknnm2o6i6waxq7kuhmzcbeljr5@a4wy3prshu3c>
From: Jameson Thies <jthies@google.com>
Date: Fri, 10 Oct 2025 17:10:13 -0700
X-Gm-Features: AS18NWD3EfN8pP57xJObsE8Nw-y-Yhc8QT1UxXovpeEXkcrZFbmuYOLzuOBOTJU
Message-ID: <CAMFSARdzoZrv4oXxVAYRcZJgxdLcrTMVAVGa=D8H=9c1vZ0zKQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,
on early ChromeOS devices using this driver it gets added as a
subdevice of the cros_ec_dev mfd. But, we want to change this to load
the device from OF/ACPI nodes. The issue here is that older devices
which don't define the OF/ACPI nodes to load cros_ec_ucsi will still
need to add the device through cros_ec_dev.

So cros_ec_ucsi needs to support multiple methods of being
instantiated, and going through cros_ec_dev creates an intermediary
device in the path which doesn't exist when the driver is loaded
through OF/ACPI. I'll add a comment explaining this in the v4 series.
