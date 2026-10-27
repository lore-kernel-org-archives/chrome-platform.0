Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105409;
	b=DojIq9T1ekSBAB7Se2FFCW48y0ur0ccp0NXlLShbOpWiYYg7SQw/LwAjJVr24uPIImbR
	 mxDfmG1NKxFaqyE3sbSxQSwDrjRgkB9FjrGTpiDbhIThoQSFDzqY87teUniHSKIB0I+X2
	 6rpg3pa4L7SeNkLnk9ufehKrQKZsPYHHIIplY24/wIxrMBZkCf8t0INp8qsYODnmk67qX
	 1ykWyEyilhbYiNjDyE8xHAvU6/IgZuZkP5hEpvjHzq0NcQXpGmQjZNat5ItTFd9P7UZ6U
	 bSrF5mu8dMY/QhRJV5rclXmvdQtUOWRCXKqEMvX3SpxzjC0wyzgjSro4oLixJcgkqjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=;
	b=cliGwHOc2F0/dNVJ9pjSOqdGLN8Uy6qsZ9ER5RP+U5Tl+7eSnPVmZaj/U6VLtJieTy51
	 /QHx5FirxkHcDjSib1J/2ODylLi7D7j1KV6rIseKbNLhHF8/z+HFVHkZgz2YzhZ3A2hyk
	 vvpu//rvwFBOFol9CuW31/6Li4g9+igVbxHQPuuJ3ravUFkg+DSDrlAC7XwEJOm85oYaa
	 qJa4AkWAF0Fv0DR/hBAwW1HjSl0HEiCwnHOyzo4kflpEEzCT4WFqYT8eKYT8qVTBIVj2s
	 eS9kzUKNPE5plSMz+h28WAPREPZJWmMs8ESXThY3SbTKO+9K+V9hMuXhnS0g0hVDoEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I5YoKn7f;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2B460A2617
	for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 12:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2B460A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I5YoKn7f
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bccecba199so3487588e87.1
        for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105407; x=1793710207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=;
        b=I5YoKn7fI1IPzdxlL3nXxocO9ntuOasC5fso7nkQTCPMcoamvL2/1yaQLqfwB/yfls
         9HnGBxzdXJy1xKE99DMyvznEnh09329lxiEmPx0h6Tcb8ILjET/Ku4J6s/CtQn82kU3m
         vVfAIf2kyEEgg2I81M3lK1CoPPQd0oOBuMOwgACCmpcMUyAWzh1ym6kkxqo+gqzrV45Y
         vJRQXSdsbKQATJefaIdotBWovVCapaoO+v9yy2GpSOgGKIx0iL4Rv/yWM8Hm3U2ZA/4H
         DjRTc8SJIll9vDiRJHTqR7Mgo172B1VZlfjcgVZ8CZAs/3N3F1Vr9XvVbf/sSTp61Wdn
         Q/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105407; x=1793710207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=;
        b=asuGRSqC9UlxYDeDzoUkm5LjdZAdR2heatYmV9RboRwGC85fksVzv+fSktu01hxLfH
         SuVQNObYERJShBrImcL9cdv3htybqpiRBoSZL6ceDWllIx4WuAeVTl5DVmG5BjsgFpxa
         lngpHRxYa8JxlpJMh3Ox5HB3fDniJnKktLZ4wU81UN33Q/ETzXvM2/7RwMrUBSAgqnv9
         4iMrSL80bXZzC0xYdJhoMKK0FSFugvVisFMhipD7OZ/SLsKrZoDW3l9TXhElhG9B3Qai
         YifwCZMoJtB3KaNa1J/Xiyd7pqc2ldKNI3ZVqPx2O+gps/0Y1eXmw61+X/X9CQQR36B5
         OIUw==
X-Gm-Message-State: AFq9FYIj5VK2Cx8CjPqZVEg9DswrmxdmaTIHT4w6BzxjynrVvxr8poaH
	Od6CfpjKGWz9wtPoD8PPnd0ToxZeetLwceYrN4pbHMT0wDWy8/5g8+jn
X-Gm-Gg: AYBFou10kZN5P/Gt6w19aDV2BVjYLl5tlBi4kWGIlLc8jV9f9UlzgdZezLomt+EOpwE
	wqDSxV8NZ5nodY+dgU2aey2uDuDgIqtpvHJgrAUW/NMkKb583WHsjCXnlLTgtT8x8Hf1Z4VN4sS
	SW3WDg10EWINDRAt9WibnH5V0wfCzEgkG7qHatoZpbWBdhLmWVv7GGiluw+XBcZVsT27ch+or9h
	9HF5a6Il/oIxdLnoCJV7XqU1iScg4jCbEqSZVJIb+R7QSMsgqM6xC5s5SK8hKcUTzshim7XfyzC
	ZsoOalnmNSpRqaAiXw+Kn31oxZN24WVgLD0r64Z+SaYJ8TcaJsPI8zCU7A9TkJ0Xr9GvFkMYey0
	GfbgRufr/5e1Ku8osV+FLRRGlduu3e0RvTJ3wDbb9qzU3Ce3pxmj+yimDbfAIfeO2Htfw/0sEKC
	rS16Uqk5trEweA3caW9WwzgTbPOltrmoQgh9SAn6wGzr/n0UMbiaqbEd0tI5v8XWVDTNwB8ZI1v
	WrTwxLo5vRGfwrlxvWWvIE3xd5XNnasB70qEioTbqEQHvLbdTsVjqMTVzzerEl8Esi1/GkQSLop
	1Td+/8Cl94g/INDGXkkL2QPgsyKm3Or/HmoH/xaFnQ30Xym0hdvZ8MMzqFtQlE9Evg==
X-Received: by 2002:a05:6512:3409:b0:5be:50f5:f789 with SMTP id 2adb3069b0e04-5bfb71c4555mr3678914e87.45.1793105406758;
        Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 4/9] iio: accel: kionix-kx022a: annotate the lock helpers
Date: Tue, 27 Oct 2026 14:49:49 +0200
Message-ID: <20261027124954.110697-5-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kx022a_turn_off_lock() returns with data->mutex held when it succeeds,
and kx022a_turn_on_unlock() releases it. Annotate both so context
analysis follows the lock into the callers.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/accel/kionix-kx022a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/accel/kionix-kx022a.c b/drivers/iio/accel/kionix-kx022a.c
index add89512af79..a132af87fb5e 100644
--- a/drivers/iio/accel/kionix-kx022a.c
+++ b/drivers/iio/accel/kionix-kx022a.c
@@ -484,6 +484,7 @@ static int __kx022a_turn_on_off(struct kx022a_data *data, bool on)
 }
 
 static int kx022a_turn_off_lock(struct kx022a_data *data)
+	__cond_acquires(0, &data->mutex)
 {
 	int ret;
 
@@ -496,6 +497,7 @@ static int kx022a_turn_off_lock(struct kx022a_data *data)
 }
 
 static int kx022a_turn_on_unlock(struct kx022a_data *data)
+	__releases(&data->mutex)
 {
 	int ret;
 
-- 
2.43.0

