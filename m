Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720F61DE8A8
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 06:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753078510; cv=none; b=eQL1qQCCLU1b+0VLiTegSF9OEi4PqATF/Dt78CL/bJ7qjnKdvZq2PhQ/FqGzyhpm3w6YdZ/QTbhBi0IIhRQMEeLF1ofFewGKc0EnPA+o1agjL/zona+3EhAl7eqmWYjNFVSLybfEbH+jOYxtdv2wjzahtKZZ2SDWrc4zU6m04FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753078510; c=relaxed/simple;
	bh=TWeXu43yZmxb+pbzaVvGUky1T6Z8e/BYaYe2eA8gviw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUhcEbW11dT70FuKXpyTvp54O2QX3g32j237dxikwTNicFzNNW+w7EUZ/1bwevAvdHXc0ECifEZMLpgU7HUj/iEVk92R3Z99JIvED/BAJcqSMnZ3iDTl8z7AmTmci8Q/VSYx6M8axTs+CBgdcLlY645ompuLPCJmrXUo1sus4jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Apm+QUva; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Apm+QUva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D0AC4CEF1;
	Mon, 21 Jul 2025 06:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753078510;
	bh=TWeXu43yZmxb+pbzaVvGUky1T6Z8e/BYaYe2eA8gviw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Apm+QUvaJPvr3xUBcFkz+YW1eRm7oWDCb3F4RjrKQbeqwdedgsw9+Khp+/81GuLAr
	 gpmDZDmzdyLJ/FJ80EF9kXrapMbURW1TJNVzYHloq9lJ45PkvZqey+FYslx7J0oZLU
	 m7WP+ERs0y6nz6BBMNa4zcY/dEKLA6RbWpyKSQiM=
Date: Mon, 21 Jul 2025 08:15:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 5/8] platform/chrome: Introduce cros_ec_device_alloc()
Message-ID: <2025072114-unifier-screen-1594@gregkh>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-6-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721044456.2736300-6-tzungbi@kernel.org>

On Mon, Jul 21, 2025 at 04:44:53AM +0000, Tzung-Bi Shih wrote:
> Prepare to decouple the lifecycle of struct cros_ec_device from specific
> device by introducing a kref.

Ick, are you sure?  This is a device, so use struct device for it.
That's what it is there for.

So shouldn't this be its own 'struct device' and let the driver core
handle it correctly instead of trying to have a "child" structure with a
reference count that is not shown in sysfs at all?

thanks,

greg k-h
