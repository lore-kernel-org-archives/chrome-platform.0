Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA01C36AE5
	for <chrome-platform@lists.linux.dev>; Thu,  9 Nov 2023 18:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+ec9t/D"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6bcef66f9caso266439b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 09 Nov 2023 10:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699556086; x=1700160886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZigjSCaiZW35pzbGAtzzxAweyaYy7ML3+66Q8mfqx8=;
        b=H+ec9t/DyeEhKIf0QVG8AcCeoNvu03610GCEzsILCh61GzoTkdvgwbVwuBL2Mg3zgO
         iU+QEAWsk/Skq/kDoH3a7kRuwaaPbhtbaifsv3dAgOOB1GPYmQAziwBkKRJEXJ0Xd1sq
         1R8ZUyqNyny6Lv8qVvNJjT+GOD8G0x05gnrPRsHOAixZCEyQGwyZlWVXz7pGjKytIFfW
         PDJZXwJuVYx93J8l13s/eHgL9pyQdRpjBowL4Catm/21it/t4XNodqgMrgp9jiLiFmm1
         fo0MwplMPwtGVAm9cs04JxFlU0mMnO/PZf5S4lDey+/o9rJ9xG93XwVluUeGNIbBl4mS
         DSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699556086; x=1700160886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZigjSCaiZW35pzbGAtzzxAweyaYy7ML3+66Q8mfqx8=;
        b=IYouKQ52G+fwBpfMMRxIziyyDy4zjr7RKDgvafBHIZjf9x5N6G4B3EMT3OBbe2URNT
         wAyllLIzoNXzOEni8Tj3tTR1vSQLBAWhLdCfWAPpinLk1aH62EKbJUC0+L+14UCBs4YA
         mCbmfVDnl5KreaT+pXvNUeexuLBLc0E3PhrEL14l2iVIffwgP5ZUToJjTiNZrMXCWtSo
         Y6Kn0idXyNv8qT9z1QfA7JbRlxRClK73iVs+4OACD6+V39GSOf76f/KJUsiejb9cN2+R
         dJpQJWd+KRqQF4AVCbWXBl0FsteJ8kXKI6cuZmYuyNGueovxUs8BE18ax/KAPQRRFVgy
         KBTg==
X-Gm-Message-State: AOJu0YxXmW8JoZn7KH6CiGy8+MQ9K7rCIGZjPlqr4h5ff2bQvirUV0+g
	9zBXIL96GoVY/cpRj3I0VaE=
X-Google-Smtp-Source: AGHT+IHeqLbyCgXBVVLAULQWHO8Gl2fCm8y0X90Y6EAOlAh9qbtosKyPKoy482opmxo8aw486o1s3Q==
X-Received: by 2002:a05:6a21:9996:b0:182:2282:f3d3 with SMTP id ve22-20020a056a21999600b001822282f3d3mr6213666pzb.1.1699556086143;
        Thu, 09 Nov 2023 10:54:46 -0800 (PST)
Received: from localhost.localdomain ([140.116.154.65])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902d71300b001c61921d4d2sm3821837ply.302.2023.11.09.10.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 10:54:45 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 0/7] platform/chrome: Implement quickselect for median calculation
Date: Fri, 10 Nov 2023 02:54:32 +0800
Message-Id: <20231109185439.1535962-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series improves the performance of the
cros_ec_sensor_ring_median function. Currently, an inefficient sorting
algorithm (> O(n)) is used to find the median of an array. This series
replaces the sorting approach with the quickselect algorithm, achieving
an average time complexity of O(n).

The correctness and performance improvement have been verified through
a simple unit testing, including a micro-benchmark [1].

In addition to the algorithmic improvement, this series includes
several typo fixes to enhance the overall code quality and maintain
consistency.

--
[1]:
static void init_array(s64 *arr, size_t length, s64 seed)
{
	for (int i = 0; i < length; i++) {
		seed = (seed * 725861) % 6599;
		arr[i] = seed;
	}
}

static int quickselect_test(void)
{
	s64 *arr;
	s64 median_old, median_new;
	ktime_t start, end;
	s64 delta;
	const size_t array_length = 1000;
	const s64 seed = 1;

	arr = kmalloc(array_length * sizeof(s64), GFP_KERNEL);
	if (!arr)
		return -ENOMEM;

	init_array(arr, array_length, seed);
	start = ktime_get();
	median_old = cros_ec_sensor_ring_median(arr, array_length);
	end = ktime_get();
	delta = ktime_us_delta(end, start);
	printk(KERN_ALERT "time of original function: %lld\n", delta);

	init_array(arr, array_length, seed);
	start = ktime_get();
	median_new = cros_ec_sensor_ring_median_new(arr, array_length);
	end = ktime_get();
	delta = ktime_us_delta(end, start);
	printk(KERN_ALERT "time of new function: %lld\n", delta);

	kfree(arr);

	/* return 0 on success */
	return median_old != median_new;
}

/* Result:
 * time of original function: 897
 * time of new function: 16
 */

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

--

Kuan-Wei Chiu (7):
  platform/chrome: Fix typo 'preceeds' in comment
  platform/chrome: Fix typo 'perod' in comment
  platform/chrome: Fix typo 'noone' in comment
  platform/chrome: Fix typo 'lantency' in comment
  platform/chrome: Fix typo 'kifo' in commet
  platform/chrome: Fix typo 'change' in comment
  platform/chrome: Implement quickselect for median calculation

 .../platform/chrome/cros_ec_sensorhub_ring.c  | 83 ++++++++++++++-----
 1 file changed, 60 insertions(+), 23 deletions(-)

-- 
2.25.1

