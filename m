Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0494D155389;
	Tue, 28 Apr 2026 02:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343885; cv=none; b=EjqFUn/HOE1b/nuremD4I9TSRZFQwTg/WiQLSR+C9oIk1urmp14tBUyhpc816Quhve4PHl+75av9N0wMDbvPRLdj59c0W1lp790/uKwK7q3+YPueWcwfcIfPWOmL9tEYzdmQtOkbVoiF8+i5ZaiQwA57goC+DF96KNdH1nVPmSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343885; c=relaxed/simple;
	bh=okaloYPon8DAhXYSEsquTAyeKoknTTD1+umwgSJr618=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRukJgHMjI9XdrIfMA8tYF11k9SWWySKBVQGCULmgopmKb2saIWS9XwYfrD+7gt/6VfMvOXrfuOUyoRC1LNQZs6E1pFKYS1ZQL3POGKaDzeITqW9/kYYj31mRn23/21YAWTZ3WLnR7ci7ilB+gJUEFwLuIkJRvpKI3UHqsVJ05g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M83BIp3G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M83BIp3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6538C19425;
	Tue, 28 Apr 2026 02:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777343884;
	bh=okaloYPon8DAhXYSEsquTAyeKoknTTD1+umwgSJr618=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M83BIp3Gn4AEgXHtZfC35D8I09ufaUxCHF+meM+otdoSSyP7GD0b9t87y4XjEG+Re
	 Sbm6mTnorLafnR6cCNVwCsmE9MxTuUjJvTVLgcUwTu7XlkSc2cBRtgex+kBlGyAdZE
	 K+b0RKRYP0ql5vMDUACVgLAnnd2mNbSqR+7R1w5PIP0yBBBFEwxMXxjlBNm50R1dOe
	 8gx2qg2ieoabP+4OFkOYbGnOkpBDZBr69VAEv0Y+bRpR4l+l9wkuqa1Y1wFjcLPjvy
	 /07ySbJVVhNssZx7oyo3dGT/EKy2TPmmEAfy4piZbxB4YqBSCNvTKS+vMopsY1gpC8
	 TNP+gC7OfnUHg==
Date: Tue, 28 Apr 2026 02:38:01 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Julius Werner <jwerner@chromium.org>
Cc: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	briannorris@chromium.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: google: add bounds checks in
 coreboot_table_populate()
Message-ID: <afAdia0BcNIjlxjZ@google.com>
References: <20260426214739.117131-1-titouan.ameline@gmail.com>
 <CAODwPW_N-ARU21zd57OhyUH6qCbC5AE67nFhT7AuwO9RFFEJ0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW_N-ARU21zd57OhyUH6qCbC5AE67nFhT7AuwO9RFFEJ0w@mail.gmail.com>

On Mon, Apr 27, 2026 at 11:55:51AM -0700, Julius Werner wrote:
> Reviewed-by: Julius Werner <jwerner@chromium.org>

Julius: Please don't top-posting in the upstream mailing list [1].

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions
