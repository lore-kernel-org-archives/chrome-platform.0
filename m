Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A27319871
	for <chrome-platform@lists.linux.dev>; Tue,  5 May 2026 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777977401; cv=none; b=lpOcfYQ/5n4JiSm57ccCfn70tlIoctPdDl4u3Jo1Rf8KwqX7ikkWtECyM2N07eqcto0trH1G+osSMKdQK7BHHvKbFzB/zuT3+lTBE9hs21xE2g5lHXz7UbjBefbnMEqzjrb0LyPo0iiO44QdP8jgClDW7UkmImiCMnSCc+19Euc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777977401; c=relaxed/simple;
	bh=YYe0UsBMCaRl/SSTsNMvYXizf5N50Ge9yNyjOI2yeog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D5wpcaM0Er7pDHbb/5y/qHZqkX4nzSYaQVX1SSCyP4GkVjAi5xJ1fn5eHT0OKyLjppZCJE1HAxmsdXnk3sNTIC4K2W9yVZ00WLkxQx97pA3f4jMMWDHd7nhXtu6qDjdWU1I47TWlXu5D7ck/lqiCY7KmRNXPmyEYEMfsGWJXW/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvjCcozE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvjCcozE"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so3564878e87.3
        for <chrome-platform@lists.linux.dev>; Tue, 05 May 2026 03:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777977398; x=1778582198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYe0UsBMCaRl/SSTsNMvYXizf5N50Ge9yNyjOI2yeog=;
        b=gvjCcozESuQnnv97fTL9JRddJmpK8qoIcIL5jDUtZ44sPvCiH/FvAu4TpGVHxFQeW9
         U2pFFK72j0rsuzEWcAilIIVcD/ZcKks0W6G0hFEMtJ7NA8ioIWPpZvMQNE4Y5vg7Oo6q
         D8l/Y8H7kwqjU1rrWoe4W/4BMfDnRCYP8wnKu0fNLXVCTQiozTLteq5UygULSf3zqXuT
         tWK/34fEWXcD8MCKGJEERUGK3dh+cCqXWrZDP4fcu3yMHyly7wIQBJsj3e7GHJ5Dd/hX
         dmqJCRnKuCcEoHA7HMay0ttGtb+RDui/5q09NyhP2R6F6/0iRFZ2j4WwC07SvRzFl8sn
         ZZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777977398; x=1778582198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YYe0UsBMCaRl/SSTsNMvYXizf5N50Ge9yNyjOI2yeog=;
        b=gkVU4ROM9NYUGB7nZVhmy7Ozj8dOJHHhxwyGuM9t5XfuKjZXqZzCy8B/z0o+5FsLql
         FYbjvV8hifhcbPoRztMZq2f6vTSjyE3xG/xW1uIDk6CrX9f3ZslCukznn1oze+69Jx1b
         7L1oEjfQJy450KmWoFmelYEfF3KymfgiQ/wT7JiHhx4PC5Zbz274YUGQAHuLCCjkJSbj
         KSK4CaWnQBtWpsbK2hzCuo+DHbJ0lWWhjDos6p049NsjYrvQLhUkAT50GZHCy4MJ3WuU
         tgHnnUyylqGF284QmJhrKibuewCvvuDZDeE146RKfCVv4RUSbw3tpEC2LpoG5t57118D
         O0bQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FRgKbaEvKv8T745tABJXdkOEcuJFPAA6ASksTbLVsYHP+rZmu2S1X+TO1+TbcReYXX8w4hTGYSZfevsl6D8w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDXO0IVEAw+4LDnRGnAB0fgw9lRdGCIKhG6nasKbAwVOUTWYC+
	1IH9byw73bEIJl9esolyQtG/3o+j0o8pn8GjvWiiLynoqx1PpgwzK+hy
X-Gm-Gg: AeBDiesVZbEK3dqf/qgTQtK7qolifjdxvkPZBBtKvnfvUeIm5RvmO8i+EHRCs8I+aV8
	Ma0IykzhGo5fO+r+1TweKHIdHtH8g4n5K/9lI6YVv62hwcqCyJSv1v2881Ym2OYqkhtxhQRw754
	wsLPdMfU1cyDlvwuto1CsNLDJPkWUk0tfH7Vrf0nXRD5Rx3XJmk3iHEzod8LYBLCzSV8STfqQMO
	vineE0D8XesgWEAEa2mw8tzw5MlKFXfHffGx/90t6sjHXrdi2qVf9BkVoDefe90SbYR0Gv414Gh
	DutfFoNhlmVsBI6fJZB58u8dGG1f0mzEq/2wQcZ9/ujtLuJpoSfpoUeW6myH/B+VfypRvncLhgE
	wDD0TYdG4Q8EXnJwN4mFqqiHkWuq14u1DMwHxb9v7M2iHnGT2fLvRUM6mdsojX7apHq8Nby56ME
	9+xqzCKMohJvx49LbZp1bvIHrB5WebfzY2z+dakxeBkjgnOv6zxEBy3HYUsQZ5bbAoZt6/iv4=
X-Received: by 2002:a05:6512:800e:20b0:5a8:6391:4fe5 with SMTP id 2adb3069b0e04-5a863915030mr3062779e87.26.1777977397888;
        Tue, 05 May 2026 03:36:37 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c341848sm3774443e87.65.2026.05.05.03.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:36:37 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: Re: [PATCH 1/5] perf/arm_pmu_acpi: fix reference leak in arm_pmu_acpi_probe error path
Date: Tue,  5 May 2026 13:36:27 +0300
Message-ID: <inv007-withdrawal-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1777889235.git.vebohr@gmail.com>
References: <cover.1777889235.git.vebohr@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Yeah, you're right, my bad. The `arm_pmu_acpi.c` patch is definitely broken.

Since `spe_dev` and `trbe_dev` are statically allocated, they don't have a
`.dev.release` callback. If we hit `platform_device_put()` here, the refcount
drops to zero and triggers `device_release()`, which is going to scream about
the missing release function. At best, we get a messy WARN; at worst, it'll
panic the kernel if someone's running with `panic_on_warn`.

The kernel-doc note about `platform_device_put()` is really meant for dynamic
allocations where the release path actually frees memory. For static setups
like this, the original code is actually the right way to go.

Please drop patches 1/5 through 4/5 from the v1 series—they all suffer from
the same logic error. Patch 5/5 (mfd: sm501) is the only clean one, so I've
re-sent that as a standalone v2.

Sorry for the noise.

Valery Borovsky
