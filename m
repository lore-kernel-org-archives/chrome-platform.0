Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6221F1306
	for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 19:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760384982; cv=none; b=NAh4HpHgYv0vslKQBpW85e6699xBDEWL/zgBSe7cQ7+AAL6m2wnBfYfH8nf7sda9r9TAJQIW8kB8Bjt5RCLxsdpe7em7vP8A3SroPtgFGK5mBea6Vr0FzHL1tLz+m4hP6F2tsGusbD+f5vZ+/rUHa9darzrY6PYIQPXVfjYrfs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760384982; c=relaxed/simple;
	bh=/DrKiXuWmXA5zXJIwBMSXqDq5Rn8SXQvuQWnNtsh0VU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8K/B7eO4Mh4bgRFYtryTwA1utZE+g26pEWextowM9jsPTBOWVEOoYrYygCsLAzgKzXvJMyMEXz+U+BYxES3N/HiUizrxGXAhuXv87/KitmeDFMLXMzUgEKXUZCMi8u0OUf4CRGKUuYYdRFCdSgQvr/i0xQY2j7LCrXhl7mSlQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZExsAbgf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZExsAbgf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so49177135e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 12:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760384979; x=1760989779; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/DrKiXuWmXA5zXJIwBMSXqDq5Rn8SXQvuQWnNtsh0VU=;
        b=ZExsAbgfi1Xokf4NlDD69eLlYKM7aOLmtlSQr42UR3j+rU+XO+E0D0+ZBPuXNm+UEO
         22SrkNjOSJSmA2XelUufaaZbt9kYE1U0zLZ0+xhC8mg4S5h6u7QqSFQxJrsIJt6VUq7B
         +acMm31V2YTrjOWsHy+ZlzWio/w81t6Pq76Mv/IUeicE2xzXsnObtIMn1l5DxdUyrrfg
         9qIeYHWmDUJ8oBNXJkbJ3nwAkHVdnyknJTcEC75wAVsn+A/dJH8WZ4vdvGqVJyJqccfH
         N6mvdC+wyvLGZZvu5kAPnbBgZA81lYsV1VazsrrpC14OT8qw9V3VznbtXZFW8X1ASB9L
         lAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760384979; x=1760989779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DrKiXuWmXA5zXJIwBMSXqDq5Rn8SXQvuQWnNtsh0VU=;
        b=DxWpHltymWJo5LH2PFY6PwAGSgmiNawUnrgFfLuN2s0GiBod5yIAddnOT4gVe73Lye
         uypCGcW95Y3g4rRoWXmr0fGG8VSZgOCHBtC1dM7UBNl48WSj9EfnJEdxV9u0TeHSZrhx
         /+gTk1bDFc1GBLA8gM+dOVfrPfCDvTeptvIRSJtDT3w/dhiDUMBWf7DAyccqNW/KIpEF
         W7lRTN/iD7Msop7DoNBHAauQVDmpfRMBtr/m2F7dTAEJBbjPbIbkDibLGJyuI5tPUMnD
         eu5Mv+B9SYbr5Bf7Xv7VQp1H4IR0gB+sFiQhSoLHlwKG61BLoi67o7O7Kymcw0U13Oo/
         wwxg==
X-Forwarded-Encrypted: i=1; AJvYcCUbx4S/T0WdErw7P6SNnYKE2dzZnLLaMhES9QuoSSd+9KPzAfUNyy8GkgbMfmS0DobSUG7ViLFASVHmMUrX3Eo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr/P/cM/IflID7IlvPZFnv3slkII2Au3e5SjdPDRecUy7QyJyN
	brymqeW79b/vAT0xTsmxA+drqxV0Ip4f+bdIjrChzIvJQvkiIBhGV+y7cdVeOlJuvNpwiD73Ip6
	QUtGJZbiQhwfoXfnWhyjWpO21l+afXGUlF+1bMYlG
X-Gm-Gg: ASbGncvwGMwUQvxBM3clboSlhsuppDuH8Q0fXo/qa++f8deJoph2PUx7jUrjJqPWJJx
	VxgfTaS7Mh1OvjSnGgsVMbsTS6XHcA6ohd8BDtRegQdOhw453IegDL++MFFioR+TeECT9hbY/hZ
	tRpsoFf2Q8BBPbK4AgjVL9yDOxNVIe6dXWSBBHVb3pvbrMPgwGgcgTxy1xjoVNwbDjibZjykHi7
	nWUJvQh2yB2RxoEpo6O47CjNQJMWB9+lBvAVZAwBcj2CrJ84xCcZ+RJ9C5A+jhz8nh1SzkK3Q==
X-Google-Smtp-Source: AGHT+IHY0QThJviNDN13Na0YoMT4nnE0a7l4g/aXq2yJNMMpvrw4aO2zCu7aZscq5GGO+Y0OCsnqucCGtPNGmRlRxaA=
X-Received: by 2002:a05:600c:4e01:b0:46e:37fe:f0e6 with SMTP id
 5b1f17b1804b1-46fa9b090d0mr180438765e9.30.1760384979034; Mon, 13 Oct 2025
 12:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251009010312.2203812-1-jthies@google.com> <20251009010312.2203812-3-jthies@google.com>
 <alnlmxbcv3ivhh7iolfqsurhknnm2o6i6waxq7kuhmzcbeljr5@a4wy3prshu3c>
 <CAMFSARdzoZrv4oXxVAYRcZJgxdLcrTMVAVGa=D8H=9c1vZ0zKQ@mail.gmail.com> <fciyxaedvyqeppldl26rsy7hogoi2zks6tq6m2yu5xerfjxo3g@u6vzsiicv5ke>
In-Reply-To: <fciyxaedvyqeppldl26rsy7hogoi2zks6tq6m2yu5xerfjxo3g@u6vzsiicv5ke>
From: Jameson Thies <jthies@google.com>
Date: Mon, 13 Oct 2025 12:49:25 -0700
X-Gm-Features: AS18NWBSBKFbpC2dPCDDX4XxbL8PoeUJPBg6KiZ18nToguJJIvN2knvCEUtPr-U
Message-ID: <CAMFSARc7ySH4VhGbwd+CXXC9845NUkf-RE4gKeTW8D_9zNY--g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> IIRC, MFD devices support binding subdevices to the OF nodes. Do you
> plan to use it? Could you possibly point out the example DTs?

I'm not planning to add this, we want to move away from using the
cros_ec_dev mfd to load cros_ec_ucsi. On upcoming devices using
cros_ec_ucsi will just be loaded based on ACPI/DT. Regarding example
DTs, I'll point this out in the comment.
