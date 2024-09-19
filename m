Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28568198A02
	for <chrome-platform@lists.linux.dev>; Thu, 19 Sep 2024 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726734459; cv=none; b=tV8ZW+FvWSjvcp6XRFuxVwRSSNXaHVK6WtnAhCJ4XjjbMZGdT0UAlgAYIvCBpyMQsEVWVYeeIM1dxsWcFc5khCz2bwDpbBymkiHg99qeCipsNS1ISTkV3ZGE+kJWLxm9lG+zqI3Se5MRXKw+XExmSJYT8Qkl/HNwbsSJZwRbONc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726734459; c=relaxed/simple;
	bh=QcDrd0Bom5f8U4n+mF62zsdk2ksV99gv9Jp1224bNKA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nw1y2b86ASTOowG671pnysMiA6fRjYM5B6dMh85N2lBefkCjslGRbuE+t5eWfG28QYIUnbRcaUQ7pSo4wWzWXg4AAI0EZfVwH6QWnQlmq1b+OM0m3UsRimsLGh58dq2OqZKXjJI6fTqJL7fCZOF1zOx6sM5OOoNU4s6kY3YytRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YvwJvwUs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YvwJvwUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726734457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lArsEJUM9CVWI7GJs9U6NCil92cWLLEKF6YZxDN2YT0=;
	b=YvwJvwUspxT2qCy3dB1yESS6IVJJpz4dXrrVkaQZxKpZFBVJuwVVqZSVLqlduguPAeQ/9C
	XqTzcckSiKOTn52cDZ+YcKuEWmYK/FuGOlqeQ8u7wcinqDLgoq+OwHAiRQsgnVUPhs+Gd8
	N9Ju3tzodkZ4I4Cd5SIuGs8rR+DuJBw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-R8Q3XljvPT-RV9gP3odPag-1; Thu, 19 Sep 2024 04:27:36 -0400
X-MC-Unique: R8Q3XljvPT-RV9gP3odPag-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-374c294d841so382121f8f.1
        for <chrome-platform@lists.linux.dev>; Thu, 19 Sep 2024 01:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726734455; x=1727339255;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lArsEJUM9CVWI7GJs9U6NCil92cWLLEKF6YZxDN2YT0=;
        b=i0rwIQ5yx6XoeDn1tUcM9nylDOQxkU6WQ9WMOYll1JWlNiwkyRzlUM2y9y35rxABJw
         N4D/3gfYS37ed0xCafLqB+2Pl6H+P+UQaLOnqpSc0Q69eOE5MIT0CxgCXwkHGi6wXYfg
         ow3xKhnX41MUYp/0uL3C8ZYm4ShjOrVi52huUeUe738Z6EbGuZqrk0zV47jStUzd9bgJ
         afqfP1g4kKyaf8jByD905hHwkYL3Kf8FZJY7Txj7jKZFKzLDRCoc6B+29SxMWkaaQUPe
         Da2GwOyRjpTRcxqjMjzq5zhov23s2wOFt/WCIygtp9lEw48vtlaNYFRaqoZdFXQKtnNf
         UNeA==
X-Forwarded-Encrypted: i=1; AJvYcCXmzhzj/qrajtvJ13Pk0is/aQzL8t4nwkEClwqfwvULzBR0e4YeEUuN9kdP0ny8q8CcgkCg9VyZI4D8EYUjvk4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs22e9cqRXpcUZ94jl0crlxZkqC0KxyY1XiCJ9S7XOlI4YbYJi
	QArYROZ/3LV1vKvOS105YuOfTm8XyeQQpZtBZSRlRv2LqcAipZ5x54g21gPXNfXgtHNtxIZcyqz
	Sfw07ZRd2kN9v3zXsOjkn+PUlPZlDpjnRY4qEWvu+GcFrUvvkoUSE834xDIWQP1UI9w==
X-Received: by 2002:a5d:6348:0:b0:374:c6b8:50b5 with SMTP id ffacd0b85a97d-378d61e26bemr15418159f8f.17.1726734454758;
        Thu, 19 Sep 2024 01:27:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmvESs/4+ZH+exTPNQkONx+oj5rCX6nhIeWJM9Ry/Lu9oxFoPa8CRU7XyqEcFx+oZrT/mAWw==
X-Received: by 2002:a5d:6348:0:b0:374:c6b8:50b5 with SMTP id ffacd0b85a97d-378d61e26bemr15418133f8f.17.1726734454291;
        Thu, 19 Sep 2024 01:27:34 -0700 (PDT)
Received: from localhost ([90.167.95.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780578csm14623798f8f.109.2024.09.19.01.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 01:27:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 dri-devel@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>, Julius
 Werner <jwerner@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 chrome-platform@lists.linux.dev, intel-gfx@lists.freedesktop.org, Hugues
 Bruant <hugues.bruant@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Helge Deller <deller@gmx.de>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 0/2] firmware: Avoid coreboot and sysfb to register a
 pdev for same framebuffer
In-Reply-To: <ZuvVf5XRMqjD8G9T@google.com>
References: <20240916110040.1688511-1-javierm@redhat.com>
 <ZuvVf5XRMqjD8G9T@google.com>
Date: Thu, 19 Sep 2024 10:27:32 +0200
Message-ID: <878qvojbez.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Tzung-Bi Shih <tzungbi@kernel.org> writes:

Hello Tzung-Bi,

> On Mon, Sep 16, 2024 at 01:00:24PM +0200, Javier Martinez Canillas wrote:
>> The patches have only been compiled tested because I don't have access to
>> a coreboot machine. Please let me know if you plan to merge both patches
>> through the chrome-platforms tree or if you prefer to get merged through
>> the drm-misc tree.
>> 
>> [...]
>> Javier Martinez Canillas (2):
>>   firmware: sysfb: Add a sysfb_handles_screen_info() helper function
>>   firmware: coreboot: Don't register a pdev if screen_info data is
>>     present
>
> I'll queue both patches through the chrome-platform tree for v6.13 if there is
> no objections.
>

That works for me. Thanks a lot.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

