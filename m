Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8962117DE36;
	Mon, 23 Feb 2026 08:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771834648; cv=none; b=byC8biosen28SFgfBIibGMZk0HZ8Zv/ztugavV8Oe9t6g1ZuLfOZhkEDXQPZQkrl4YVDmubrfT7wSbD3NpGrhId5pu0ypr1QU7Pq+/txCprArQ/xu9IyL2vSGJ/GiU7TBeziHcaP5BXOCS9tEfgK94/xlSKnDlv1C8jjXRjcCMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771834648; c=relaxed/simple;
	bh=8RbSqlsODmibWCsqc5wkA6M4vX03nOCvnXi0Bk9Cp1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQ68syLtVaEoPRuL9hh9Z6t5bamyBdvSFW3F8/b5oQAUBeqyQO5A5krW75ZBWGsGPIRbs+VrrBnvPBibmsAjLOdAo68WOwJWxnxKoTi7/a9wJRsIY/RSHHtXKzg0L92h0ApKzjDpAVYGx4hOe4Kn+uFeOyWgeZAk7JcjF9YVG0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sy2eVy9o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sy2eVy9o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEF6C116C6;
	Mon, 23 Feb 2026 08:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771834648;
	bh=8RbSqlsODmibWCsqc5wkA6M4vX03nOCvnXi0Bk9Cp1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sy2eVy9oFHf5UpZiShqc1G5fGkuAuVEeFCpz9WjOUnWnH4Hk8LgzehE4ymE83CtAj
	 G1UB2FJ1dY2ZXxncqwa80zHjo9ZZcVUHiouQkenIY3sU2qo+sC1R54S4Gp/d0VKUGx
	 fzFL4fhpzzpZpR4GBIHPUbSPGU9poFS60BnbY2JvUiG0M0TuiSuBaR9QVs1LoEUV7H
	 G1+RFwlkmjOkadcoFvdlJumnsD3D41n5sslKGboNjR+cMbhrsEEG0WRCfpjxiGQdNR
	 V06hn0eCuyP7BGXzRjThj1jHFOrtj+CA3I/UiW2tRAddKTP7bCsLw4wagO9B1cU4K8
	 WVIZM98aF2+LA==
Date: Mon, 23 Feb 2026 16:17:25 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: trunix-creator <trunixcodes@zohomail.com>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_lightbar: replace sscanf with
 kstrtouint
Message-ID: <aZwNFdO8NMY4wLy9@tzungbi-laptop>
References: <20260208221335.16030-1-trunixcodes@zohomail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208221335.16030-1-trunixcodes@zohomail.com>

On Sun, Feb 08, 2026 at 02:13:35PM -0800, trunix-creator wrote:
> Replace the use of sscanf() with kstrtouint(), which is the favored kernel
> API for parsing integers from strings. This avoids format string parsing
> overhead and improves robustness.
> 
> Signed-off-by: trunix-creator <trunixcodes@zohomail.com>

Thanks for the patch.

Before this can be considered for merging, you'll need to update the
Signed-off-by line.  The kernel community requires the use of your real
name (legal name) rather than a handle (see also "Developer's Certificate
of Origin" in Documentation/process/submitting-patches.rst).

> @@ -243,10 +243,10 @@ static ssize_t led_rgb_store(struct device *dev, struct device_attribute *attr,
>  		if (!*buf)
>  			break;
>  
> -		ret = sscanf(buf, "%i", &val[i++]);
> +		ret = kstrtouint(buf, 0, &val[i]);
>  		if (ret == 0)
>  			goto exit;

This is incorrect.  `sscanf` returns the number of items matched (e.g., 1 on
success in the case).  `kstrtouint` returns 0 on success.

> -
> +		i++;

Why it moves the increment to here?  It seems unrelated to the patch.
