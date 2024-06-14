Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8F038C
	for <chrome-platform@lists.linux.dev>; Fri, 14 Jun 2024 05:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718341507; cv=none; b=cX3kB2Uftf2B7l+wc8Z+WieTC3rlli9Aw7Ltg7YjapGii2wdWm07ztJeXu3uB5Yro9bNzZ8VFxHQwJaMt6D5qOdQGWf1qYbLiTHYi4lqL/YuzQX/QTgC/YJVzcpN7lt+f6GPQdAd80kUv5GySZiyGLlaaWARoFNV0COqtrsGXp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718341507; c=relaxed/simple;
	bh=IukhxcX3qDkzoO5Zy8Nrlq5s8wAmwy+/c7BkQCbdyC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4et2EM2DsElqwfHQ4Afi5F8d6H8xvFY+LabR7jyEln9wJ6sjW+wG6RiavDGk6pCiXjGvww4wK6t18sbMaHJsYFflq1k3Rz9pKxubSwDsnU1grsww2RrUaT2LA1rPQri5TiS2T6eHmDMcTHH89FCxMHL+/jyEFijpBB/86YpQaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ti6mGG7X; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ti6mGG7X"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42172ab4b60so17736075e9.0
        for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 22:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718341504; x=1718946304; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EWNNIgMpJqUN8OKFztHzayuDCT95LOD3ZJqMZeNQQ+c=;
        b=ti6mGG7XmImHp5mCkJRk9Q++t1eOo31Ta7kRvPjFzq19XkZCsB7PKcLSs3Q49Xtp6Y
         qcNJX/DX+CKU1bisOftYxFR+Clw+tmcx+jMtzdNhKTjXxw9VVA9DiZMq86drQEuwG2Td
         p8iuhHF22xmJQU3AhOag/mvFhoch+4+g23YNftIFTClA2aLTbxACyHx0daNvRsB+rFye
         iZglMu4CVWjs8Rjg64l+orQTSj3Dq62lISCQHzfysCOQWF5LXb3mv0m0faLVJ2rF6mNN
         YUnyhkMOHZ3qySaXiISssa1wQOgFoTSUxb3wmEi3ZF3QQlBOeh0V12Nk2YGzZQyAqj9g
         01PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718341504; x=1718946304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWNNIgMpJqUN8OKFztHzayuDCT95LOD3ZJqMZeNQQ+c=;
        b=EEMyj2YdG/cpejW6f6iKPIokVH+HJhAo+Qx5jLSQmOl4UNB2muGJIBplkAAeyrDQIt
         +dQxXrWKqA74/YCgByMqpDP4D6ghdyVtwD4oQyVcrBZ3qZg8009tRU2aZFdrVYTjW6dm
         bImBwOng0OX+cK0uaezItJs0wNpxhDLn/6CzZ2CzJFkbPyK1BkBNyuLr8z7t0ws+FlKt
         9s+D2/f100DPUi4yoNfjWPL8hCdRLa3o9+uS+qlbAwZO+rsvCEUti8KKHRcyD5zUQpfI
         nTFJvtopTaT3coRLAR2/Wdxnb6i3O54CKazPAxQs2cZlqko0M8FZbfJiYQkoeE2nnzI4
         Y/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv/RxmMj7orEnYSk+eBlRypDSxck0sFBaqPedTMWZReHv/Xi4q539mAq1H2WjHaYleJL6PAXZNElb9VJKzTwBZoztCkVd5AKgY0ODARa4s
X-Gm-Message-State: AOJu0Yxee1b/oX6PlJmec18P+bsvBcMr+K0lLXLowqLBDabDT02CqgKQ
	auP6ebp0WjYfQ/SWRK7On/eAjh6k3pfcMAanMF9t6DXI0xYCDbwFurW4ZMNSYDc=
X-Google-Smtp-Source: AGHT+IHAc0Yh7ji0lwnDCu2Lv4w/FZ4Yx74voqdotxBtp/d5ml1qvOCQlfNZBB82HLxJCmKCwVO2Zg==
X-Received: by 2002:a05:600c:4ca9:b0:422:52c3:7fe0 with SMTP id 5b1f17b1804b1-4230482c1e9mr16109225e9.22.1718341504275;
        Thu, 13 Jun 2024 22:05:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de5d5sm83206355e9.33.2024.06.13.22.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 22:05:03 -0700 (PDT)
Date: Fri, 14 Jun 2024 08:05:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Walsh <ben@jubnut.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Handle zero length
 read/write
Message-ID: <590a7d8c-6bfb-45f1-bc26-d99837cff2a2@moroto.mountain>
References: <20240613212542.403-1-ben@jubnut.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613212542.403-1-ben@jubnut.com>

On Thu, Jun 13, 2024 at 10:25:42PM +0100, Ben Walsh wrote:
> cros_ec_lpc_mec_read_bytes and cros_ec_lpc_mec_write_bytes call
> cros_ec_lpc_mec_in_range, which checks if addresses are in the MEC
> address range, and returns -EINVAL if the range given is not sensible.
> 
> However cros_ec_lpc_mec_in_range was also returning -EINVAL for a zero
> length range.
> 
> A zero length range should not be an error condition.
> cros_ec_lpc_mec_in_range now returns 1 in this case.
> cros_ec_lpc_io_bytes_mec checks for zero length, and returns
> immediately without beginning a transfer.
> 
> Signed-off-by: Ben Walsh <ben@jubnut.com>

Ideally this would have a Fixes tag that points to my commit.

regards,
dan carpenter

