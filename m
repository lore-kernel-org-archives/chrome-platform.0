Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122DD223DDF
	for <chrome-platform@lists.linux.dev>; Fri,  9 Jan 2026 10:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767954638; cv=none; b=dDqwoQbu87/3goR3nTYHRgwNc4KsH+m+bF1eNmxl+VPNk8YE8npXrKQ/tPNlZhnlMIeyFvcv+wPp96sIm6k/hWiwVYCnx/4XP2/honVZynCnFwK8LXUN0XK5j/VuhrzzGNDYfu29g+kZ/e5Cb6BhJ+S0bHJNVswkArx6vhMurcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767954638; c=relaxed/simple;
	bh=lMFHvc3iW1W9dRS9JlbjH4zrYcy7pzGuFSe8TR0mF7Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zmw+v5B0c8Qrz99bI0GvBvWsrMKAwWDN6BUY9/L2MFBMd04zV8GfckLLoYklfaDn/dlkh2R8UcFxEjCoYrIe6sysnIlJfByahyAEpv4eKv4pMeJVlzLiSVxqwYq0gNaApWzZ0/vsxD+zGI20FnOIhhKUSvIrhahTxNcP+T/JuRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lglx08h8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lglx08h8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767954636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Or8IAm8DMEjlGLwYFk0TDuR69ADiPuraPWznT0Xmmz4=;
	b=Lglx08h8/AVu7tuEna5FARxNOI5w58kVb51GsP4woPSa4R8z/ukZ15rmLd8fAzbelr8r0Q
	lAQp+6UeubOTisuH2DyK22hnX8Bh89maPxfrFbKDuFVSK+dXJ7YCbjSw47AhzkH3yBvLoo
	yqrmWLjHNuIuguk+1CfWX7BQEmZOP3o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-fiMTy3WQOlGaRrMSLl4vDA-1; Fri, 09 Jan 2026 05:30:34 -0500
X-MC-Unique: fiMTy3WQOlGaRrMSLl4vDA-1
X-Mimecast-MFC-AGG-ID: fiMTy3WQOlGaRrMSLl4vDA_1767954633
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4776079ada3so39465335e9.1
        for <chrome-platform@lists.linux.dev>; Fri, 09 Jan 2026 02:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767954633; x=1768559433;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Or8IAm8DMEjlGLwYFk0TDuR69ADiPuraPWznT0Xmmz4=;
        b=TwuFT0al5G0AknjjdLow5bXrLyz36zaQ6IT3/M8H/LI9/W+Qv/yUvEGr2ProrPyqeL
         Od2oWk+lG8M2Xj9DFDrE75UIV0QZe/j4Y0BYukGpIhGWn8AU8doSppWNvv0JDMPPphmH
         ubJT8rkeh50qENA7IzXHxg8h7wbrT8sUEAcgmyNwgoe/75B0Gr8psqoUEbkNXJonH4iM
         0bqe9Vb2u7WqCuD9XrKnY8Vl4vY0jn13pnQH7HarRoi9r0BO3EPtGg9KlfrgpPD2fBFI
         CH1fcGRDaXLm9tJOKVOPj0Gtxe7rtjnQ+MWcNZwA1kOmMu6n3vom70oZBaFsK8T04ZPQ
         PDYA==
X-Gm-Message-State: AOJu0Yz0hl6Pk2uEug/Gze1LaS3a3Il0bfHlPW9f4JkfFZvEy75A6/K3
	IQgrkO2HIjUElLhdqKmTrkvm+KkzcMqqnAHUDh0f4xOC+Oc26u0vWSCM2+eLVu3H2+0iUXsrmge
	9+IE/TFNl7FJG/5eZjPjQ5WxmSXn8LGOz3urzozRT7qobQEFpyPjdy2CHPeLv5/n1VOttYg==
X-Gm-Gg: AY/fxX7+pg8/GH5nNo/52gSlq+VGxcECkFqYzRMMFATACy5NZiz0jAvsSqJVboNopUq
	LFSNFr92zj6ZvTnLBAwZ5zsbQjEp9xia64bjNQg08aSZVdu8YxqdclPGOrlqRA4sVh/XHGwIsGr
	E+I1jrgddIgPB9hcttt9fHwLD22C3PMPrXuFqsHZVhzLGXeTRxAUxVpj5iTTUgz3W7zsRY1n2kO
	iMpSq4LW/0a3AXnv7EOY/q/IL4tq9uY1oDMnezPY3RElIyHWJvmMmDOT+3N/1BcAj6e++BXrxS+
	PqkinbqVljdKCU37S+eh9pTWI7sWQuNIWK7iIzfxtDRBEsWxsSrFVfqdkH7/hUUUaqF4xP/dNS3
	xJrpgc6XcoHi2LdiixlhjlXqVv8uUh1trXCOcRW23pGr1jxMM2IhqZVDLK/neVuv/SRXq
X-Received: by 2002:a05:600c:190e:b0:477:9aeb:6a8f with SMTP id 5b1f17b1804b1-47d84b1faffmr112688465e9.9.1767954633362;
        Fri, 09 Jan 2026 02:30:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJWqmcnhf3Pym5/gUyHqMBkqMpq203LptwKXeouWsLNM1hUThsE3LO+qSzaBLD+lFqXD439A==
X-Received: by 2002:a05:600c:190e:b0:477:9aeb:6a8f with SMTP id 5b1f17b1804b1-47d84b1faffmr112688175e9.9.1767954632937;
        Fri, 09 Jan 2026 02:30:32 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184cbsm212824775e9.6.2026.01.09.02.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 02:30:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/8] video/aperture: Support coreboot devices
In-Reply-To: <20260108145058.56943-6-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-6-tzimmermann@suse.de>
Date: Fri, 09 Jan 2026 11:30:31 +0100
Message-ID: <87h5svf588.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0pgHECT69b7q_93PsJrhYAJznvU9rlmKf5iQlxWOeU0_1767954633
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add support for coreboot devices. Until now, all devices with system
> framebuffers were on the platform bus. On systems with a coreboot
> firmware, the system framebuffer can be represented as coreboot device
> on the coreboot bus. Handling the related graphics apertures requires
> new interfaces and a custom way of removing the coreboot device. The
> core aperture code is independent from the type of device.
>
> Also move around a comment that refers to both, platform and coreboot,
> devices.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

This patch also has merits on its own IMO. But it depends on patch 4, so I
don't know what the merge strategy could be here.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

