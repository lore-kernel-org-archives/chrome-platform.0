Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8451B24635E
	for <chrome-platform@lists.linux.dev>; Wed, 24 Sep 2025 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742293; cv=none; b=QNAxOUTlx001l9m2INcVqfY6Mgm6fjsDa318EH7zECrxDBhXy7nfZYCbXqATLBSXuZ7dtAU2u3mxQTl9+GD9Q+Ep+/GHlo8Ee1xGqTo4xKM61MJGVCmgkGdQZxo3GAkC4ON3CPVobZx7WfOk969WheMcsDM8DRrLUIRWWfCN4cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742293; c=relaxed/simple;
	bh=USTPbmjc7larzUfmJLTr1dEREs8PNqu/Af6hD/JnsLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EipOiKv6n3IDRRz/aU9h76irvD1A7iW0i48A9RscSNKKe9uJL/Y5Ooky994O4tuqBuY19mGOJ5yI/9b0Lj1/+arjaO8e3gZv8XE2wFgR2ALDeMr8Ll9fDZWo41uTgEC0zQ8FRsTx2oQiIh3wDTOI6ZUcnux+r+L0uPpLq+IEHzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKgQ4apF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKgQ4apF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3306d93e562so193080a91.1
        for <chrome-platform@lists.linux.dev>; Wed, 24 Sep 2025 12:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758742291; x=1759347091; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YA3h5oB7JadoxHehwa5NeGVTyzJoF+sGhLuexgW7Bm4=;
        b=lKgQ4apFFOFSFcPiniPg3ZwA3xinoiE65DF5ZHhfMu1NOXh/4PSVSQOvdptJKrhmg1
         7Jg5UMF2s/2JJ1TADuOolEX62awQrJ90cq5za+UKobJwER4RcCC12k91YuOUssczwfGl
         TEQ4cmJ0m45r904KdsaLxDnrdHtDCvTCmKjeB255TXl7FD6GIHQdO0w8vhACmtt7im9R
         sfDrEgppMErfvztDElbYzFhlecG/wdv2MZ8+H7bVwImDobMJsAJ8TV8+vvk/8JhweCD7
         tAv7AtiP0JqtWKGt3yWKOupzaaLt6KNP5eD8Mogvos5hy4QnCTa35RhX0WofsL7iSWWZ
         xMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742291; x=1759347091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YA3h5oB7JadoxHehwa5NeGVTyzJoF+sGhLuexgW7Bm4=;
        b=AU/FlsMDHc1H15GmknS0W1bXIJAAVwaIjJTi6wGDpZ6W/uMiixnqgaoFYA/HkdNpy9
         YiizYr28M2jCZ/pE5tRakucl7lJNmq8ZC28RmCxyAqzb0ehItDGC+sBFXHT0wAo5oxOu
         0rLamEIqZoNaikdxszsBWPPpyJPFiAv/irg1FNOrEhFHT9h620gMsIZ46JhbpCjiI+XL
         H4xY/UXy0RIB7NLV0M/3TcTbuuxrPqZI30h7onohOo1ta1zvvOE42sUhE3CSMFpZg5Uu
         2S71nCaRZaf8qt8jfExXBkyAW/+eqmxFainoujDv5PwsZ35kZSIRzA+EHkcxZNyB8M2/
         9syA==
X-Forwarded-Encrypted: i=1; AJvYcCUWbfHTfbEJtI/OJiYW++q7GlSn94UDl0NOeMsdIqd5BiALWfcjDKQEar9jrsjQTeERaLHHVQvAzq6dIGWJ8Ks=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfkvZgsVnYOCsjLc2K7KJ/zlPOctzUaAScDGCrv05B5tUpqRqK
	e7TPJTg+VuBf490FaHPJNRCkICmrGcLg6xHRdBxO0UBvweC6GRLeCgFF
X-Gm-Gg: ASbGncsC/MfLpr0NE3lrtCKkLvFni0ZDNB+BA3WUywV5PkCUcD3aUCf486ZLp4/ijGc
	nKER78VKN2at1UWpCLcpGK94IqtdPs5ifTrv4tn9UBZ0QeULNF0hLtLR+FZOCKg6DcQwlTETMsB
	7GCWeh18s3fxDGY62AsI1w54U4p0x0AFaOTnj5WU6zEZI24NwypsXUUoNWXJMsGO5SvGx8sCaYp
	izcTq5v5Q/Q4Z+7sc4frf/sAc+29wzn3p5cgOFuoDMfSN2PCaaCw/wVxSW7qUHThRd6osi1PD6m
	msskA4jEW8g+9doyjpCdz5cLVKZdfdOSgelRAYhOwFy3gV978/OD7Re2cbIHdHExrIqa8qDzGFU
	68q5zkj+KpeSkIDY2xt3zsrhbJ/g1ovgY3k8=
X-Google-Smtp-Source: AGHT+IGf79Ctst2lzMknAqjXUhWGTlNDl/Rp/nJBOnuaOSO/Vxp7PZh8N9WTKkOOb7wF5fRUDXamvA==
X-Received: by 2002:a17:90b:4acc:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-3342a22bf2emr746435a91.7.1758742290588;
        Wed, 24 Sep 2025 12:31:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bdd63c1sm3208982a91.26.2025.09.24.12.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:31:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 12:31:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>
Subject: Re: [PATCH v6 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <c2dc1970-386f-4e4f-b1cd-ca849d002aa6@roeck-us.net>
References: <20250911-cros_ec_fan-v6-0-a1446cc098af@google.com>
 <20250911-cros_ec_fan-v6-3-a1446cc098af@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911-cros_ec_fan-v6-3-a1446cc098af@google.com>

On Thu, Sep 11, 2025 at 06:56:36AM +0000, Sung-Chi Li wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Register fans connected under EC as thermal cooling devices as well, so
> these fans can then work with the thermal framework.
> 
> During the driver probing phase, we will also try to register each fan
> as a thermal cooling device based on previous probe result (whether the
> there are fans connected on that channel, and whether EC supports fan
> control). The basic get max state, get current state, and set current
> state methods are then implemented as well.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> Acked-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Guenter
