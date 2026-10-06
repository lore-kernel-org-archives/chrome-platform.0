Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E9039FCB1
	for <chrome-platform@lists.linux.dev>; Tue,  6 Oct 2026 07:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791270902; cv=none; b=ug2g80xSz4owRLDImJdl73nBjHxeCLsYOE1I4Z848g2/RM/K5Ou9UEuBdOLHgeAKP340+tySZgmAnTycmevx+zq/w+Pj88wYXx7AudAYXY9pTuQ4tbbQBNvx6F69kmFeH8hJneXDrrHdV01T31KZLKwcSDXxjTfLaw/g2ZZlKGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791270902; c=relaxed/simple;
	bh=JNpViAt3rztoNvFFvGSsB1bX3qB9kMWEiZy0iNQ3tlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGi0xXix5P3cYCgbJp6XpE8CxDdFSKJ/VEys3PwaCW+7NKe43PKXEj/LXR0iXMG7fpxu50pjs1Xp9sWia3gLlnaiLGxEnF26xps4oxXs9Dm4tVfzE0XK/oRyybvSXSiAkJQKv5pcCjCG0+DQOpDYNrgrBdmJUVtOY4+OJ41ALj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rw/d+krE; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rw/d+krE"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-868b3248b2cso184100b3a.1
        for <chrome-platform@lists.linux.dev>; Tue, 06 Oct 2026 00:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791270899; x=1791875699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNpViAt3rztoNvFFvGSsB1bX3qB9kMWEiZy0iNQ3tlM=;
        b=rw/d+krEfFnh1Yn9Nda70qRY9atKJOKO6zQXLDf3Zs+uJ9jlmLxYhNxiOF7l6GuZXU
         dG6f9UVrAXlQMe5lqkBYYCGWxlqiSj6OhqVNi52gO4SVyLKYOj7Z4c3HolBmt5ALnN+D
         o3DJKYDOcaybGcwBNw7UBvBikgacb01Jdw80A2E1TuJ0rPQGr1FLcG+cxA4g2Mz6NfOG
         t1V0NfeGoOyNz3jtkJxZPmd1dYheClM0aQr1PkLxV51/7CiQcHFPzad8+l+bakr0v/MF
         qkROmjYWSVhg2/XOj4j/Est4lCD7ThzLH46ouvxe3tOJ3BWRkFT+21/gSzBDJF4DRBxF
         Dnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791270899; x=1791875699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNpViAt3rztoNvFFvGSsB1bX3qB9kMWEiZy0iNQ3tlM=;
        b=Ua+b3tRcXGWKTjC+vgpERwG6f4L2nOa+mYzLwxW+W1/d1u9M0lwIahQYseqt2yIK+6
         ODOQp2Vjz3qPSPi7EiMo0dhB8Z8nDNHrvNCVhWliGChhE2ThwXJ7dDqgtYxX8LJ5e3TF
         KFu6dtyDlbmMM5rLpPp/mdhnFFQfKWlbBQZezxznO/KckVLLtI/T5sBX0nUXgY8mKnOh
         pQn37z5mIZnKlIUg9SHLm4WGTCJ2k+ZC+GIyHvM4Gggv6rY33GmWz9Sw+h2kfST76Vh3
         co/pjh+xsLa1NtfpapY5u81LuQYy+0SoHN4HtrQKKd8ELkqlOWJOyqMhQn5eS0D/Dfia
         I+vw==
X-Forwarded-Encrypted: i=1; AKwUvBwl/g8m3vK8CDG53kmtixYJR/sUNFzVBmoBBFc/9TlaEpW24zxIx7VgZd6R4+qQSUPsulYa3cuwN0D1LpyAHzE=@lists.linux.dev
X-Gm-Message-State: AFuF++lG51pJFjkH2pKXWQ9XfHEhLJAr0T632i4imHMWh0ufQlOVvlwz
	t9y/9EFpRUc/qP8lnI3mJ3xLIQQwUtU8zQJjoxRlCPLBDdK5TxIpydT6
X-Gm-Gg: AYBFou2M0LGxl+VCQbvcIs8ulvXJXRB1K6u81FmxH7horsOzIj3tJBthRk6W08jUGG2
	s84P/Dr6lgZFoW+lSpGKq8qrrsNvTA8GH5fXyAHJdkBYpU+yz6N21gCfGRRwFQJjTIf6sgobksG
	ZmbJUeireWSg/iH79qcuoS+h0sdQCYiLLHoexhLvEZBa+2I9E6S1gWqKnkVNydZVzW3qXtq3J7D
	U58BgORgDqw8LIMGWZUcfR2sk7LRDLbCD9IBVeWmiQmxTmx76hBEsULV2cPTpUwSSQr1k/E39yG
	5hOa8N/+o8wI/e7/OuUxcBkHTZwPKgPPOQAVIe9quvai3P+z0T4gV3oOU/+8oPpyFyWZIVwGyHo
	eA/RoW8pB7JkJqVPv6MVWj02idsCXdHUbHYPae/vb93Rs0lYAl49Vz7mdsr6RNYF+mHotqQDEaE
	TpmKaEn/Jp3VQq+54AnDZ4f4Dw5mfzajbxWkLF7fmosRfwPbOULy5KhiBnCAILzOTOjX8u2QmPt
	HnsHWX6ZNk3cfuwP7jKjBj2yYptqZmGCe12RspsF8IrtnwsXMMVxH16G3WKRPvgDMtMZVrI5efs
	LGlSdDsKKlb40g==
X-Received: by 2002:a05:6a21:9191:b0:3de:4976:a0fe with SMTP id adf61e73a8af0-3e124802d96mr502913637.64.1791270898475;
        Tue, 06 Oct 2026 00:14:58 -0700 (PDT)
Received: from eve ([2601:644:4300:43e6:fe7a:b82e:befa:cd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6ded11ebsm2073356a12.24.2026.10.06.00.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:14:57 -0700 (PDT)
From: Sergey Tiraspolsky <stiraspo@gmail.com>
To: James Fairweather <james.a.fairweather@gmail.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Sergey Tiraspolsky <stiraspo@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_usbpd_notify: Only use parent drvdata when parent is GOOG0004
Date: Tue,  6 Oct 2026 00:14:50 -0700
Message-ID: <20261006071452.11422-1-stiraspo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003222855.23707-1-james.a.fairweather@gmail.com>
References: <20261003222855.23707-1-james.a.fairweather@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 03, 2026 at 06:28:53PM -0400, James Fairweather wrote:
> Only read the parent's driver data when the parent's ACPI node is
> GOOG0004, and otherwise continue without an EC pointer. While at it,
> drop the reference taken by fwnode_get_parent().

Tested on a 2017 Google Pixelbook (Eve), where GOOG0003 is also a child
of PNP0C09, on 7.2.5 (linux-omarchy 7.2.5-3), with this patch built as an
out-of-tree module. The probe prints "Couldn't get Chrome EC device
pointer.", a charger unplug/replug while awake and another while
suspended produced 13 USB PD notifications, all taking the "EC device
inaccessible; sending 0 event status" path, the suspend resumed normally,
and there were no oopses. Without a fix the same machine oopsed on
charger events and on resume.

The test was set up and checked with the help of an AI coding assistant;
I ran it on the hardware.

Tested-by: Sergey Tiraspolsky <stiraspo@gmail.com>
