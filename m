Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009DD1F9AAB
	for <chrome-platform@lists.linux.dev>; Mon,  3 Feb 2025 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587631; cv=none; b=N9FKubetNHAwd+m/UehbWH9rmYB4eimS4dxtLAdsVdA3TFWI1YEhNjoZWHucJc4DkEME4oLg89B9MG8NvNlD8LvgR52iF5ft//sH9KpomjLsrchueSATIuHjpXaiIywS6tkdZkUMAtacly/717XBErTrZtk1wf9rYN/33D3oda0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587631; c=relaxed/simple;
	bh=gFIWZEoVs6xewuG+1TslnugeikW2pgRsWls9beBKmD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ErIDnGpPvsB6iFnUjkSQDKCgW/keoqWYJGYrbwwdUpSykc5t5pDsB/u/XKJiZ+YbZf6wzsHqQzlJt6379doRiW1ftgx7SU5kK8n2EFVKRyqPGhzh4c6vTbW6vp9xhks+GKFBO32lTsIV4fI5VYTHMr04di0o/Pk0j9Qlp3bPoMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ju/j7d7e; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ju/j7d7e"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dc82e38c10so6227961a12.3
        for <chrome-platform@lists.linux.dev>; Mon, 03 Feb 2025 05:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738587628; x=1739192428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7+UC99SbiXoliFqpRVlAawjVamIlotYzITqskdPO4ro=;
        b=ju/j7d7ehMY1D+K3eyfcELyn6JO4l4ceT1jKB6/dRgFw1iaXY/HlYHMrzr+vBJ2b5Z
         K2FfqoCbgOrYaJEINXNMz3WF2SDM6h3OKQduRETJbuFnhqGbynvzZ+pL0YqVWSSxblw8
         +xgrlEwLOl8vun5/B9+QZqfDjF4H4mPwmPaQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738587628; x=1739192428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+UC99SbiXoliFqpRVlAawjVamIlotYzITqskdPO4ro=;
        b=bIu2a8R5GavQ+pQJptduQ/tCvMXU6h3ZSmwkcZQauecSlDULWPn+nWU1NAXVuv2yze
         m3d4HBhuAMyeVy+sDI6o6qDlIHdNsG+CiDvUBHZqSYZMr01CFw2iBgXKcjhwIc7vIkyq
         z9tGnx51xJRn+A5DPYWXTyWg5TPQM0lnNgBRejoYMb9trit8+CZuyNJOyjuIU28eEGar
         SB86xHD3Hei6JWQtCnLA5kBVI61Dg9UUmIk24baqrK2guoSEpLq0SW9p3OMMdU3m+L+p
         VS/ZB8FtK/QvGxSm+pHTf8q/7DTGX+scdovUTVf+jdZRKdlLEKCCx5Ej1MN0ENjDTMTf
         AjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9sedUKScrMjEHu1IbZo3fhfLDLOPbt6NDJlLAfZbsExaxombwab5bm1fK3OS7Wjm7lFzCJCBvv3oT43+o7Lo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzhpz30q6rqVuMXrPG0YHdRlFozqXi+2TJ1EH3sejbMdsZu9cd8
	CJDwUC06v3cRvSppy9cN4YEBWepCfrTD34HgJid3GINV5y+LSWeMEw/FNShQBw==
X-Gm-Gg: ASbGncsJZxSwStyupHKRtIdBTmEivBs9y2qfxED0hfuZvUINFwNK2P8tzMeL22a2OWl
	xAoOcvXw4mk07ZX8gVJaltWP6mkrcwhnGxaMciJhLzR77DrzYsgObTG9cx3b6wZXhtawJ2i++4m
	/LlGDfBVVHINPnxs4rw/vm9m+BYm2SI8HHgiJ/92A5F2N0hSnS7ljrVaGm+PsVEZKp/DAmjqAzd
	yvMJGPaU+RF2BVyBJQnCmFbYRWP7ZyxXWuX5ylqI1ft57pSbvQPeQtCJIXgBgMqf2/Vbs3LBz8t
	//pe5ZyeFfxmM5kGtLFMOqBu1TAArRApxIsaEW6pLBsQMlo0/uevhTkyJlz06gZSdwBn2gcy/jB
	Mu5QeHQ==
X-Google-Smtp-Source: AGHT+IE6hSrWOYwnni9sRJznSp+KjHXszvDfSHNTeN4wYCdbeqIr+CqYnwkqg26Mkz9AOsrXexM+/A==
X-Received: by 2002:a05:6402:2706:b0:5d4:3105:c929 with SMTP id 4fb4d7f45d1cf-5dc5f01e7c3mr22186898a12.23.1738587628144;
        Mon, 03 Feb 2025 05:00:28 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc87f2e5easm5319055a12.57.2025.02.03.05.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:00:27 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 0/2] Add sysfs attributes to cros-ec-typec
Date: Mon,  3 Feb 2025 12:59:45 +0000
Message-ID: <20250203125947.2701106-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds sysfs attributes to expose the state of EC.
These attributes provide user-space applications with a read-only view of
the EC state, eliminating the need for ioct calls and facilitating
diagnostics.

Tested on a ChromeOS Brya device with kernel 6.6. Verified that user-space
applications can correctly read the new sysfs attributes.

Andrei Kuchynski (2):
  platform/chrome: cros_ec_typec: Expose PD mux status via sysfs
  platform/chrome: cros_ec_typec: Expose AP_MODE_ENTRY feature state via
    sysfs

 .../ABI/testing/sysfs-class-chromeos          | 20 ++++++
 drivers/platform/chrome/cros_ec_sysfs.c       | 71 +++++++++++++++++++
 2 files changed, 91 insertions(+)

-- 
2.48.1.362.g079036d154-goog

