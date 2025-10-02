Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D45284894
	for <chrome-platform@lists.linux.dev>; Thu,  2 Oct 2025 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759434144; cv=none; b=VldrFc36X6ag0TWmFaaq/A/8JvBLeZ6VFiNqadY72MyZtC3terR+Nc9dWhJdeYizl77qgBl9Ks9E7Zl8LTJNg2eTfZgbiqX+8uXKvq5SZQumet9nESFIBAHNjI4RbBR1FlUZpKNdUIEFvxpgKX+Xv7cnWXFGy6KbB9tElHmUb0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759434144; c=relaxed/simple;
	bh=Q/IteUfsdc9uXa9k4p1PZg6c341HQK2Ae1qCvKmOoEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FODx5S3pxAEC3bvY87gQMgN08ItHJbnQ2XQcQ4ZQ15XhsB3GLeh5toAX67kXGa0nyhMfeNC1qtwC2AZ8huVr1dY8a+j9YxFAoZMz/psRokA4ccJjyjrGXuF43XM7gSOmA8B6swVeJpqdnZaHXKOJPz2B5DfrYZP9CoqLHeZWxW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0DGhIs8Q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0DGhIs8Q"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e430494ccso8332125e9.1
        for <chrome-platform@lists.linux.dev>; Thu, 02 Oct 2025 12:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759434141; x=1760038941; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/IteUfsdc9uXa9k4p1PZg6c341HQK2Ae1qCvKmOoEE=;
        b=0DGhIs8Qu9CrPdmXYtEODnaLudzxMCTxemEYR0CCJvCSOTeWIt2ucjjSFvFTYnrGKa
         GbWn/OwfZJY28B/m2EE+5sxQHD5ZxZGCuKwtcWu8y/wiu8dxIWKQOeWd+QJRKHvvsaf7
         b0GD4CLHdU3abyrsM5GT7Rmb0rSARR3SrG+pKIPP4mX2Dz86PAqsMx64uWT8jotYnXaL
         JtHf9jXOZAnBJguspy+O9sBFakzCxmpw+S8JfuZqB/jBE/q3ZoX41EQyV5uYhYJsW337
         nV1qjzAUfF8dXCk3Yt+Mvo1FYNJpI/HnPFam/Hq4WMz0w2m+wJm4eolwuGv8mtv8mKF9
         GbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759434141; x=1760038941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/IteUfsdc9uXa9k4p1PZg6c341HQK2Ae1qCvKmOoEE=;
        b=o3NsLLKgj4HGkAeFAUSIlb+ju5AyRx6J64EaiQFL2z7iImIA/BbaoFmlnfAkBhN5q4
         qkCjOoXiLu2qvDWmWbUTSpNZNuZqtVbypuIEiJhHwtQTwBSZUDjOkv68BQDdq3EZplA7
         7r1G/Oub6ifR5X440YtvG3J2DQ1ApRVB8YRvkX2svH4kXzkzLcyBMt7waN+EVwFWgXU2
         SJPDMcpUbf3AAs3Gxj4Krn2ez3sY14m0j4ridmR3faud54MLtXyBzPr2s30kWpDjI2Gv
         OJpBOEzDBWvDt1yHNJmhhwbCGKN9gLB2Ro9xtl9vBstQGJeuoDxMkhv5QnowvGVG0/I9
         vw6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEtrSb1VX78FN5pKWVqhb/qoCrvDFtnCRhytMUvct4ESGh2cKYTtsn9qhCd8lPpiCFg/2twQH+714it1xTtIs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw09LOmzZcwpKsZIBrNe4NVbJM0iUIUvRCyD7HGjyZMxEijLaY5
	VdLf5t1qtRLk5aN47cKKW7MSB8Kuc2MMmkdP1ZTE/kprIYfnZGT3uPIzToP2igIkC2XjnUjoVsc
	naUKBlVpKDQDtFXygsxbpfcxaEuMOwbcIKgNJ167C
X-Gm-Gg: ASbGncvW5WVvSCWHejObEhEZV5RBZxRYtpOv5lgCHnyMnM559NteBD+R5bzODiJFmVs
	lUAtuwsDsdTV3bZlwzlp5jLbpmDOHwpLlYcRkNjyallrKn/ELQU4g4pUG2uoqaF6J25NVMQmDNd
	G2c8hIEO6bRaF+BKY7dWtSHT/RzG+RfWVqiidap7aObCIScFSMNqN1ZsMijWvXfrMNzJT8kelWk
	7s8LPgDLwJK0zb00H6vjIphkH2ml4II1we/LL29g8afqPTz0iHL6aFFZq4RsAHicus7
X-Google-Smtp-Source: AGHT+IGAzqI9zShvLUg4thsYZhAmQ3tJF1bhTlEa520l2RtxLRAkBSidqGUNoP4V3f1Wg0ZKuzlvehV00EMnag8jrAY=
X-Received: by 2002:a05:6000:4027:b0:3d1:c805:81e with SMTP id
 ffacd0b85a97d-4256713628amr300032f8f.4.1759434140951; Thu, 02 Oct 2025
 12:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250926202234.3064386-1-jthies@google.com> <aN5iyOsHILi40AIp@tzungbi-laptop>
In-Reply-To: <aN5iyOsHILi40AIp@tzungbi-laptop>
From: Jameson Thies <jthies@google.com>
Date: Thu, 2 Oct 2025 12:42:09 -0700
X-Gm-Features: AS18NWB79j0oFxpI_7gQo4UjXbQOPDnxSZuY-zTqaDlZ-r3GhEI_kvhpY4NRVUY
Message-ID: <CAMFSAReHEt7nUZvsnB5pyPTaddSVSdtiiX-RLpY4MfKq3qfX1Q@mail.gmail.com>
Subject: Re: [PATCH v1] platform/chrome: cros_usbpd_notify: defer probe when
 parent EC driver isn't ready
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: akuchynski@chromium.org, bleung@chromium.org, abhishekpandit@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +#define CREC_DRV_NAME "GOOG0004"
>
> What does CREC stand for?

CrOS EC. "CREC" is the device name used in the ACPI definition for GOOG0004.

>
> Does it make more sense to use fwnode_get_parent()?

I was initially planning to use fwnode_get_parent(), but calling that
from cros_usbpd_notify.c would require an ABI update to build for
android.
