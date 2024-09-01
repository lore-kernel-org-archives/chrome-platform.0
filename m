Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AD114037D
	for <chrome-platform@lists.linux.dev>; Sun,  1 Sep 2024 04:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725163646; cv=none; b=Prcv6ecrD427n0G+Sl3S2s0umYHVthYV/s1kVrf/ABFMjj/AUtWsw80DhRaKb2nzgiU7x+p4bZineDpwH7m0I2RrBXed1vTJQSEjuG34hnmMzZoqiSie0lS/UfV9X0BOJfxURfNQByYg8EFfwbXPiHdB48iwLWb9mswVYIKoeR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725163646; c=relaxed/simple;
	bh=2tAlkjfeIOfQ7pqxJw2iSfNqPK9cXn4z7367eyq0Rjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8FhhF5WfsD3krWfCebTQD0ulC2PsfAETjQ8/JFjWJ8xTytVwQBCkJUKF3DHLTY30FJx8L0U42gHDSaDXH31OVWPEVUiaJbKaJflH72M2/AJpoi8MGgqheYyk3TKeNaOwLhvIYjoktfbNoOfeIDW3VLQJSiWSPeVJgky1viLsqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gRcnJzcT; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gRcnJzcT"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-715e64ea7d1so2744270b3a.0
        for <chrome-platform@lists.linux.dev>; Sat, 31 Aug 2024 21:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725163644; x=1725768444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nad3jYq+zuMNkdjkLGBBGQbMhdXY1+s1WlyYMjA8ho4=;
        b=gRcnJzcT4S6BJ3WZx/WfUyzIG8WkRn2cspQn4KWBb/czuIVG8dd8fSbMxeekRuqFSr
         r3E5xe3MYJ9AncaGMvEccyA2H8eF+BVqvpuy7MKjqvKCkBcL7fLJPRS4EKUI+MFMoTys
         1eJBoP2fSgm30uOcv39zXDvPjfWiwnq1du/KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725163644; x=1725768444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nad3jYq+zuMNkdjkLGBBGQbMhdXY1+s1WlyYMjA8ho4=;
        b=sBleEGD2kmhbv+CDsBTkqmsAd8/E3Fr6B+ywSNuLKKfLyA8hWJzKN8M3tfn95sr+CO
         2YN8AVtDIKiZ109goOgNa2wtHoVnA/sTazzb69xXy9fwj+EWccasrxEX+AZMuDzkVXLz
         WXgs7HjyLQtlWJQKl/ayvx9GeuZXWomVwHaQS8ZBJNuVcqmjR8npBVpJPa3TrcUCPjWg
         H0Bb3cq06zSfXitIJHbQq2O+X6gtehIAI+r6bXUswCNGyxAVDDGiKAxIz+fxC3tg9p9M
         yagzKh8ImbPmO/9lq7oAa9ZcIxMWd3ifCTQbzFLbIt0FaHWagt8E5DfKxbw9hs4Klr7W
         zI4A==
X-Gm-Message-State: AOJu0YzzeAc9Zw5dsrVixzqlCy+MbB/LAFeb22qVjQNvvEWBru6s67sR
	Zy99EfM4QfZqWIqm21hMr/8kLPEzoBgt/xQg/QOpC8GGh1oicqm3l6gRmA+fCxq16psAq2yQW9c
	=
X-Google-Smtp-Source: AGHT+IE4gRNS1Wle0dhusZLk2Qf9YkMQZghXHbtMZ6oKKSwEP4ondmRftvf+lk7yL+f1D9vFEqjyTA==
X-Received: by 2002:a05:6a00:91d8:b0:714:147c:1377 with SMTP id d2e1a72fcca58-7173b5c8556mr4671065b3a.7.1725163643536;
        Sat, 31 Aug 2024 21:07:23 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-715e569ef39sm4828452b3a.122.2024.08.31.21.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 21:07:23 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Benson Leung <bleung@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Guenter Roeck <groeck@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Lee Jones <lee@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Prashant Malani <pmalani@chromium.org>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 10/18] devcon property: Document devcon_match_fn_t
Date: Sat, 31 Aug 2024 21:06:48 -0700
Message-ID: <20240901040658.157425-11-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240901040658.157425-1-swboyd@chromium.org>
References: <20240901040658.157425-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usage of this match function is hard to understand at a glance.
Document the arguments and the return value so it is clear how to
implement the function.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 include/linux/property.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index 61fc20e5f81f..797b1eeda7d2 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -507,8 +507,25 @@ unsigned int fwnode_graph_get_endpoint_count(const struct fwnode_handle *fwnode,
 int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 				struct fwnode_endpoint *endpoint);
 
-typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode, const char *id,
-				   void *data);
+/**
+ * devcon_match_fn_t - device connection match function
+ * @fwnode: Remote connection's device node
+ * @con_id: Identifier for the connection
+ * @data: Match function caller specific data
+ *
+ * Implement a callback with this function signature to search a fwnode's
+ * connections for a match with a function like device_connection_find_match().
+ * This function will be called possibly multiple times, once for each
+ * connection. The match function should inspect the @fwnode to look for a
+ * match. The @con_id and @data provided are the same as the @con_id and @data
+ * arguments passed to the functions that take a devcon_match_fn_t argument.
+ *
+ * Note: This function can be called multiple times.
+ *
+ * Return: Pointer to match or NULL if no match found.
+ */
+typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode,
+				   const char *con_id, void *data);
 
 void *fwnode_connection_find_match(const struct fwnode_handle *fwnode,
 				   const char *con_id, void *data,
-- 
https://chromeos.dev

