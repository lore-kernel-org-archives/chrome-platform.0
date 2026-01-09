Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ACA338939
	for <chrome-platform@lists.linux.dev>; Fri,  9 Jan 2026 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767954760; cv=none; b=HGtFcU6E0oDccYVAKR3Qzwy8jFSgdWSXKmzj4hHf0CVwTRExpCzfulNTAycQ5DBfyrRQsAn7Fs8qz7dTC37jlCKv/J9oPf8QBAm4BIeNYBsjQ8YQfELzBpIuSWbG5WDWRRcorpF3j/PtTsuj3TF7GZnkuwMf5Wc8q5ZgtbW+J18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767954760; c=relaxed/simple;
	bh=ObJc4V7iuK4/N8N/4tgs7aW9kUNkjjTAS2HFZphM+lo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IifoI0ahXvEpclv0SfUHUzo/RzcvaESyRTGfA1WmjI4NK0E2WvhBEAKI9AWcbDK2H/PGScs5YP5G+7VhB9SHMp6KDEsOjF85WXeeeIKFQr95JkVwtd5Se1eI+cTznYwFxthiV/Df5gubxFMMVJKKz/aOgWvWxXWrQh5leLWcugI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KdwUwQJc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KdwUwQJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767954757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eAlQtNmtIWNkGsFyRvvL4elBNAjOXcmk4EMceP10HwM=;
	b=KdwUwQJcdIkJB3GbdxzlpLeEjZ/wSr1o8SAW5VO7qSe7xX1b//miZmZMeqR5f6gcEQehU/
	NMpKk+luqyLCY8sG46NxYel63PeC5QwzZEPs8nh3dwccZElFHPpqcAY3Qt/oRLNf2v8KBe
	uzTfKyN4tq5cel4MaggsdAHyrsOwB7c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-sOcUyAWJO9WfSz1czqwYxg-1; Fri, 09 Jan 2026 05:32:36 -0500
X-MC-Unique: sOcUyAWJO9WfSz1czqwYxg-1
X-Mimecast-MFC-AGG-ID: sOcUyAWJO9WfSz1czqwYxg_1767954755
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47d5c7a2f54so20659445e9.1
        for <chrome-platform@lists.linux.dev>; Fri, 09 Jan 2026 02:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767954755; x=1768559555;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAlQtNmtIWNkGsFyRvvL4elBNAjOXcmk4EMceP10HwM=;
        b=krimK4AFlNKyfMZ17wUsIAXgqJwMDaL3pqoidIkZAneMj856IjSf1SEpybKWbt59bC
         sV04w+DHZg/TsdVP2JIZk3DQIjFf+RkbtdqhQ8HCipsXg6cYSXLCHgQ5sDeReYx+TxSH
         s7J3ChHaceiPWvOtRQ41JKSfc2eaY3z0M299xkdHBc0grNfkcq7M+BWdw1lm0c/FM+uC
         SwXIiQF5czJnSgz8qXibqaHigSq/pSiH/O/1ZMn2kzRH2qUrBWxLZYo4oz+6Fa6snZ3b
         sWz+MuDKeFZfMDuvkJtD50n6aqEoxh5T6PXhZ/Snef0DlG8rhUnvMq9yl/wX4q6ep4Hl
         qC9A==
X-Gm-Message-State: AOJu0Yz2uZ5XicQBFx7zaX0AFi4svfHadP3ccvkC3OA7gvKv1swAzU6x
	2bXhL5Ui9n2cYAYlZWcLYs5EDm/z1lPj4TiHCdzJs4RpiKTqK/g+UQ5vNX8YxLuZmMFNkorwSN3
	2nih9jIb4eqFBkggaWTyiwrs3GECN6WTtYaNkVapGDHem/GX9WFohk28EVWxbZwzD/462aQ==
X-Gm-Gg: AY/fxX6i6U7pqOLeX6RG/ezSJgeV2OpS2gQsG3z0ERwjC8+sQjb6t8SwhceESB4aM53
	zdAMMxBV2qB+GX29DFCYvkqm7SaFm54HkDTXPXWCAuwAddzvs5UTCtv7SNoP/jwVgEmcVw57J73
	gtPleFC0MCl3RhNa07/dbwFnxqcouvQA9V32EiX3DJDtXLthTPSAAtu+428GXweasoZJ9RSpNF9
	8iE9ja4UjG4ctFUB6vENb+C73KOMIMt4PccXS9BFppb8rowWlbjN80Of23PFEDxvdY0+57T3a4H
	WGOliBOTBLuISPT1zfixSQoDuegwyu1fy5gR/fa/mdC8xnQQfsvi+X5r1WQSvcZPl+6duJYpm+F
	RBJjvr/oIp2pZD3uuxxdpr/207fvkhPkTlbgocA5gXyvDBuC0L8pG6Ttl7TMpNi17BZmk
X-Received: by 2002:a05:600c:348c:b0:47b:deb9:163d with SMTP id 5b1f17b1804b1-47d8484a329mr100760565e9.7.1767954755296;
        Fri, 09 Jan 2026 02:32:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETFBS/84c6OLlNUw1c46PhgMv94/Y+DtAyEqQRjy5tiBzm3ee/UaLuzoWFK41czGzScD/9kg==
X-Received: by 2002:a05:600c:348c:b0:47b:deb9:163d with SMTP id 5b1f17b1804b1-47d8484a329mr100760375e9.7.1767954754942;
        Fri, 09 Jan 2026 02:32:34 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c6csm212778215e9.1.2026.01.09.02.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 02:32:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 7/8] drm/sysfb: Generalize pixel-format matching
In-Reply-To: <20260108145058.56943-8-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-8-tzimmermann@suse.de>
Date: Fri, 09 Jan 2026 11:32:33 +0100
Message-ID: <87bjj3f54u.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OKukPfrHo1h7Zjxn5ULcYfGmvK1K1bsHlXUC60VUWcM_1767954755
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Provide drm_sysfb_get_format(), a helper that finds a specific DRM
> format from a list of pixel formats. The new function builds upon
> drm_sysfb_get_format_si(), which finds the DRM format from a given
> instance of struct screen_info. Now get the screen_info's pixel format
> in the caller. Allows for matching pixel formats in drivers without
> screen_info.
>
> Convert the callers in efidrm and vesadrm to the new interface.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Again another patch that could just land and doesn't need to wait for the rest.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

