Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF831312837
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 03:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783049534; cv=none; b=ZRZ0YneuwVtehYYtIvGD1PbkTRTR1ZiS/HMJsCMccUE+wou9w4uRKr7iZpLhHsr+gme2IWAIBxfoKU3vFcNZmVOWxapZdKokV9SNXJCuB8m84lJx1y1lJ0/cRG9osTm1kOdWzssMACTHqYdSe52kjcVcmD/CKZTR2nR7aRZSY1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783049534; c=relaxed/simple;
	bh=hbw+NWzrKlOiT5Hp5HG+7DdtBDTGUL5KPv3i4fGbxT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sx22MA1hwbJbbKNPLWu5rpSKgyhp8bj3Pb1LGkpmUf2ZlYlDpqdviMtCR6xd8nHqrD+uh3nwIBIhviOtfB71QPNLrooNyQy10HrvawsvKBGGM7YiPAsFIaeGABPYOr9/NH7o1Y6vPHA5cW42rfza/NjJxP0uGAzqWha7x8SLOqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7Hm4jKC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7Hm4jKC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644641F000E9;
	Fri,  3 Jul 2026 03:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783049525;
	bh=Q1puYJrPdt8sREVpjweD8UYnsmaAYRRhQypLeJNrsp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B7Hm4jKCqTNLW6yMdZMGfFYV4A64zJWGZTZNmC4LHXnxusgN3213ZMgkfATRcogwv
	 sUjPvm+JliCPDt2pfcjW/DLKGmXHY2WmSPGtC/FP9/qBHfiEOHlj6uwcFueGm/HHGe
	 oHaU6N7gg2gmeryjsRb3orPhUPSs+hOSpENegdLbr7csfTc9YOlUFCc64vBRR40cLN
	 TUc1Hh/NzpYa88c/n3QQ9fUGUSefLNtxJzG1ydG5GxAngN+FvMHdsKEr75E2/9JS5J
	 4aX2R/L8fN2AgZTuETMfLXKdefhIdcFjdK0INR/xQZ/Ne9chmnUoNueQs5oXAvy4Ox
	 7BCvaUWZlba+Q==
Date: Fri, 3 Jul 2026 03:32:02 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev, tfiga@chromium.org,
	suleiman@chromium.org
Subject: Re: [PATCH v2] platform/chrome: sensorhub: Fix memory overread in
 ring handler
Message-ID: <akctMi7L5wSI-PXP@google.com>
References: <20260702082745.1014968-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702082745.1014968-1-tzungbi@kernel.org>

On Thu, Jul 02, 2026 at 08:27:45AM +0000, Tzung-Bi Shih wrote:
> `max_response` and `sensor_num` are read from different EC commands:
> 
> - `max_response` is from cros_ec_get_proto_info().
>     ec_dev->max_response = info->max_response_packet_size -
>                                     sizeof(struct ec_host_response);
> 
> - `sensor_num` is from cros_ec_get_sensor_count().
>     sensor_num = cros_ec_get_sensor_count(ec);
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: sensorhub: Fix memory overread in ring handler
      commit: d1ceb2b2324717fa30b44d56ef0c52813e239569

Thanks!
