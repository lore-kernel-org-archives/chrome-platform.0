Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7FD208C6
	for <chrome-platform@lists.linux.dev>; Thu,  9 Nov 2023 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CT2AuGH5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cc2b8deb23so2248365ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 09 Nov 2023 10:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699556119; x=1700160919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1F+zsKAZ6psJ2Y0k9zWx71Sew29B0knPhWsJIJOxq3o=;
        b=CT2AuGH5J3HTHRZu1NV2ZAEcqhhDciona2jECsoX1gu8FSut54YedGQzCCYk1Me9zW
         OKNKJJ6fIISiDzIIQN9RcynikJVrPJl9z/i9SJC/0I35EdgcdmGPUA0vqZpsoIEhQVi7
         e/j6e0ReLLpOU4nDMb9jXZBd2fNcCpfhYOqr7CS7av9MdrVTP/eIrJZffO80RZr1H9N7
         jfn8iSXN+Yj36lcyi6IhZeITF36VL2LhD6bPlqft76XaJbesgndQfDJDz2Z5zh+1WgZP
         fktF5YlajAU/jAPDlwrNXAYtwJfnkHBzGwkoxzZ0Aovo57cUqS+gO1oyNmoJ3OliB6Cv
         7+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699556119; x=1700160919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1F+zsKAZ6psJ2Y0k9zWx71Sew29B0knPhWsJIJOxq3o=;
        b=Y99/yRn9/IEWWYFYjurWLGtwwlYiVpj8xEaxLfLEppUDynnBnYc9GaMEtjlrunjctJ
         tQf7NY64k6TjjOsdaA0pPKCbadNKlHPvBCbMTadLjB8NuUYTLIicZh7IuAF1YjE5+KY2
         wyx3MzqAwy8EvyDAQSrqps7OdeoUl1YqdW9kjNJz+hMwGlQ4Ljg5IF+sRF07tv2QjWex
         yH8uyk2iDHi/M4B50xW7h23oebGFqknu7AEFarDrbENNXPDfJZod+pIfuaJlu7oh/BGC
         MS6uOTMGZjYWowQfUNuVVrerCy8kBUoZ7CJ7FE6QS2vOSrleJffv1aE6tm5OO/wBo4sP
         pRjw==
X-Gm-Message-State: AOJu0YyPtX214ETcANw11OfUboKLq70kNs0z683pnKAi+xWZpGtv++JC
	UhMORUUzH9M3Dl8prnuknw0=
X-Google-Smtp-Source: AGHT+IHq3DPWkkVhxoXkHb0d97mTfbvuE+JfpLRcZwmkaEMx/WorUBpsxL7/EBbJgr1HmsufXxjk0Q==
X-Received: by 2002:a17:903:2349:b0:1cc:3c2c:fa1a with SMTP id c9-20020a170903234900b001cc3c2cfa1amr6422376plh.4.1699556118862;
        Thu, 09 Nov 2023 10:55:18 -0800 (PST)
Received: from localhost.localdomain ([140.116.154.65])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902d71300b001c61921d4d2sm3821837ply.302.2023.11.09.10.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 10:55:18 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 7/7] platform/chrome: Implement quickselect for median calculation
Date: Fri, 10 Nov 2023 02:54:39 +0800
Message-Id: <20231109185439.1535962-8-visitorckw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231109185439.1535962-1-visitorckw@gmail.com>
References: <20231109185439.1535962-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cros_ec_sensor_ring_median function currently uses an inefficient
sorting algorithm (> O(n)) to find the median of an array. This patch
replaces the sorting approach with the quickselect algorithm, which
achieves an average time complexity of O(n).

The algorithm employs the median-of-three rule to select the pivot,
mitigating worst-case scenarios and reducing the expected number of
necessary comparisons. This strategy enhances the algorithm's
efficiency and ensures a more balanced partitioning.

In the worst case, the runtime of quickselect could regress to O(n^2).
To address this, alternative algorithms like median-of-medians that
can guarantee O(n) even in the worst case. However, due to higher
overhead and increased complexity, quickselect remains a pragmatic
choice for our use case.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 71 ++++++++++++++-----
 1 file changed, 54 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 9e17f7483ca0..4ac718be38b0 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -133,33 +133,70 @@ int cros_ec_sensorhub_ring_fifo_enable(struct cros_ec_sensorhub *sensorhub,
 	return ret;
 }
 
-static int cros_ec_sensor_ring_median_cmp(const void *pv1, const void *pv2)
+static void cros_ec_sensor_ring_median_swap(s64 *a, s64 *b)
 {
-	s64 v1 = *(s64 *)pv1;
-	s64 v2 = *(s64 *)pv2;
-
-	if (v1 > v2)
-		return 1;
-	else if (v1 < v2)
-		return -1;
-	else
-		return 0;
+	s64 tmp = *a;
+	*a = *b;
+	*b = tmp;
 }
 
 /*
  * cros_ec_sensor_ring_median: Gets median of an array of numbers
  *
- * For now it's implemented using an inefficient > O(n) sort then return
- * the middle element. A more optimal method would be something like
- * quickselect, but given that n = 64 we can probably live with it in the
- * name of clarity.
+ * It's implemented using the quickselect algorithm, which achieves an
+ * average time complexity of O(n) the middle element. In the worst case,
+ * the runtime of quickselect could regress to O(n^2). To mitigate this,
+ * algorithms like median-of-medians exist, which can guarantee O(n) even
+ * in the worst case. However, these algorithms come with a higher
+ * overhead and are more complex to implement, making quickselect a
+ * pragmatic choice for our use case.
  *
- * Warning: the input array gets modified (sorted)!
+ * Warning: the input array gets modified!
  */
 static s64 cros_ec_sensor_ring_median(s64 *array, size_t length)
 {
-	sort(array, length, sizeof(s64), cros_ec_sensor_ring_median_cmp, NULL);
-	return array[length / 2];
+	const int k = length / 2;
+	int lo = 0;
+	int hi = length - 1;
+
+	while (lo <= hi) {
+		int mid = lo + (hi - lo) / 2;
+		int pivot, pivot_index;
+		int i = lo - 1;
+
+		/* We employ the median-of-three rule to choose the pivot, mitigating
+		 * worst-case scenarios such as already sorted arrays and aiming to reduce
+		 * the expected number of necessary comparisons. This strategy enhances the
+		 * algorithm's performance and ensures a more balanced partitioning.
+         */
+		if (array[lo] > array[mid])
+			cros_ec_sensor_ring_median_swap(&array[lo],
+							&array[mid]);
+		if (array[lo] > array[hi])
+			cros_ec_sensor_ring_median_swap(&array[lo], &array[hi]);
+		if (array[mid] < array[hi])
+			cros_ec_sensor_ring_median_swap(&array[mid],
+							&array[hi]);
+
+		pivot = array[hi];
+
+		for (int j = lo; j < hi; j++)
+			if (array[j] < pivot)
+				cros_ec_sensor_ring_median_swap(&array[++i],
+								&array[j]);
+
+		cros_ec_sensor_ring_median_swap(&array[i + 1], &array[hi]);
+		pivot_index = i + 1;
+		if (pivot_index == k)
+			return array[pivot_index];
+		if (pivot_index > k)
+			hi = pivot_index - 1;
+		else
+			lo = pivot_index + 1;
+	}
+
+	/* Should never reach here. */
+	return -1;
 }
 
 /*
-- 
2.25.1

