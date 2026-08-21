Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7FA4B0486
	for <chrome-platform@lists.linux.dev>; Fri, 21 Aug 2026 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321115; cv=none; b=YicpOfO6HaxQgyozM5WyWYvmUcldwRgGD8iHallWtJWXyPh2kiwQUhJaYiA2CHowkwDiD8p+k+/+l/rAKb3BBDHhzr7ksqxF7MwzNPwuw9nt/5xRp3GHGSi7by9yVFAxx7h2BEHBrnmESQ8ycUKA5ONxNg2KNINqIF3Pd5Ko/E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321115; c=relaxed/simple;
	bh=1ULVjh6Ji+i5OTUW4fd781uZYqaAXvbl7KQky/eHKkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DI3i4uD3y9g1nwnGBSBahkBuAKhqGbQl2OV4FbD+qUCGn/YZ7HtdhNEGuWHextVRB6PUlgyC+zOjV2lQCifvI72xZucehlA4VyUWC6ZLtDRGzuabXQqQ8jXypU4FU/Dwq/z2XuKKf1kMd4ygWbh4LQQ3LdwXmvKDDrm7hnYBcWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7GWHO5n; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7GWHO5n"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf50c6f235so12858605ad.0
        for <chrome-platform@lists.linux.dev>; Fri, 21 Aug 2026 07:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787321109; x=1787925909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXfAXSIThD7u/o8Kez7ecU/tOp7+/Rd2dWDcoTTJvIc=;
        b=b7GWHO5nFMxguseFKlmTLRAUcYoibUfbfM5AqtbIVfURBJqQThDAM4Ng+yaIjT2xSk
         ITBqpckh/ZKKk/Pvsy1CCUhNwU1h7yPDfNyblr5+Nkc4FSvnoRVL4Mke6te/u8kTe5pk
         rxHZK141Uoe8ETNgVYKwuRwh/QCPI6oBYFkdjfzaO9aeaMDTvoMtKt/NEoW4o8r+5nhx
         nGI8rk2g8jrquhnrrSvwWZrTMsdEWjFOOkOmNYA3sMsn29TfC70C+WOkuvCDbeTcGnFI
         y/es94EzomFrDjohX4iKMWYsRRx62dJ6nBAH67ocHWDLLP+uHTfChCQs0Qq5rx4bntAT
         CXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321109; x=1787925909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GXfAXSIThD7u/o8Kez7ecU/tOp7+/Rd2dWDcoTTJvIc=;
        b=a9IGhku2XL9BPV5Ed2oiryXEnn/YKNoQaICeMn8ogfTe3HqbAdMELvPp5ScGA7iGf3
         cf4LbVebCYXxtTtDKBvUC4NiAHVieh0Agvm94xvjnxUiNce3qlthbejLjlpWFZLV3PF2
         L35tzlg8y9v6H3G6wuxr9Vr3w9LydC+W6jVJdvPskiQumDsxNYBVUluwxc30NFzzcz57
         q2Kt7j2M6JvJNyURMWjee+cq1Cqf0I6fyCyGnU3dFvyLOPjhZYo11x9cDUnHyvx3YxLC
         CaFIEfN/M6yA2uZ9UenXbGRtsgNt9Q7RzTMp91SGSrHFEReWWNFMoZFPbMi4VPZKJSEH
         LL1g==
X-Forwarded-Encrypted: i=1; AHgh+RqNUegpr0tABw4DBdzduowtsi3y8N7ACErgAbrsCHlrVM5xOIv+I04pbeDKmulEyhjkunTEugGf8dDketVWfKo=@lists.linux.dev
X-Gm-Message-State: AFuF++mN8wyzkfwbqLlW4M4hnPCX/zR39vuZAWWOtu6nldMilq+4RThr
	aRd5PwGEajz6frGcFF/mzkSQ7qf8Nq+JvLfeGPNWuc6kfZ3R7wcFe1I=
X-Gm-Gg: AR+sD130579hLE3WUMsX9Oz/Ma7xAOz2IHaGHirQ+zJe/wvlYOxVXNWWpCCUa3RXtdP
	LPQJI83KGQlKXcorPmXlbeKdQylYVqVN8ST4hO6aO66zcDB3KnGDno/zF1oefgk6AvhON3QkU9o
	ZNnekQJXd5YsRFj04hzbJUNHv/Sxs+C4EmJzYXhDSf1ln1XZ1xGr8Mhxs7sCAabv0UxyYjyiilE
	yAekd77RxZz1kWHufSXmcryKoLj0oi5b04zNO65M8QpRlEyQz2cB38xKhdAeAp16/+eT0KQ7ris
	0FVTgPlnaqAq0Wwkem+hQrAEFexVt9wTRCXigZju3JfM+sdbjGIvYEyG/tQMGFlc62Yxstqr+bA
	StadtMfFzCscvHt/5ZjEAn04Q3ibwhDUD0zkSx9Gr6Qpl59AjFh1cCm6MeS8AYQV60Ndvy/F0w0
	6B0VbI8qts1x7BiWvhRp8KM3V5z4zD5h037X1D82l8T7SmusqvCnD0JQ8hpzuBAA2mI2rUSMVRi
	goE7COhE2IC4Sdjnb61xds2vanvssJ6/hyHXho/q/60Po0N/63W3AAB1wU/TWmx5jXg
X-Received: by 2002:a17:903:1b23:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d64b036caamr145862735ad.10.1787321108063;
        Fri, 21 Aug 2026 07:05:08 -0700 (PDT)
Received: from codespaces-2db70c.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1d8sm19842045ad.52.2026.08.21.07.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:05:07 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: andriy.shevchenko@intel.com
Cc: andy@kernel.org,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	dlechner@baylibre.com,
	groeck@chromium.org,
	jic23@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	triet.hoang.dev@gmail.com
Subject: Re: [PATCH] iio: cros_ec: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 14:04:50 +0000
Message-ID: <20260821140451.3969-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aohUjlM5QZ7BLob3@ashevche-desk.local>
References: <aohUjlM5QZ7BLob3@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 21 Aug 2026 16:37:18 +0300, Andy Shevchenko wrote:
> There is a macro that combines DEFINE + EXPORT.

Hi Andy,

Thanks for reviewing. Should I send the v2 with the update?

> There is room on the lines to make them longer a bit.
> 
>   Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
>   and pm_sleep_ptr().
> 
>   This lets us drop the __maybe_unused annotations from the resume callbacks,
>   and reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.

With the new commit that you have suggested.

BR,
Triet
